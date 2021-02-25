class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :set_address
  

  def new
    @order = Order.new
  end

  def confirm
    @order_product_in_samedate = Order.joins(:order_products).where(receipt_date: order_params[:receipt_date]).group("order_products.product_id").sum(:quantity)
    @cart_items.each do |cart_item|
      @quantity_per_day = Product.find(cart_item.id).quantity_per_day.to_i
      @ordered_quantity = @order_product_in_samedate[cart_item.product_id].to_i
      @stock = @quantity_per_day - @ordered_quantity
      @new_order_quantity = cart_item.quantity
      if @stock <= 0
        flash[:alert] = "#{cart_item.product.name}は指定の希望日ではご注文できません。"
        redirect_to new_order_path and return
      else
        if @new_order_quantity > @stock
         flash[:alert] = "#{cart_item.product.name}の#{@stock}以下でご注文ください。"
         redirect_to new_order_path and return
        end
      end
    end

    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.invalid?
      flash[:error_messages] = @order.errors.full_messages
      render :new
    end
    @order.order_products.build
  end

  def complete
    # @order_products = OrderProduct.all
  end

  def create
    if params[:back]
      redirect_to new_order_path
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
        amount: order_params[:total_price],
        card: params['payjp-token'],
        currency: 'jpy'
      )
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      if @order.save
        if @address.blank?
          @address = Address.new(postcode: order_params[:postcode], prefecture_code: order_params[:prefecture_code], address_city: order_params[:address_city], address_street: order_params[:address_street], address_building: order_params[:address_building])
          @address.user_id = current_user.id
          @address.save
        end
        current_cart.destroy
        render :complete
      else
        render :new
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:receipt_date,
                                  :receipt_time,
                                  :postcode,
                                  :prefecture_code,
                                  :address_city,
                                  :address_street,
                                  :address_building,
                                  :total_price,
                                  order_products_attributes: %i[
                                    price
                                    product_id
                                    shop_id
                                    quantity
                                  ])
  end

  def set_order
    @cart_items = current_cart.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.product.price.to_i * cart_item.quantity
    end
    @today = Date.current
    @days_array = []
    (1..14).each do |i|
      @days_array.push({ id: (@today + i.day), name: (@today + i.day).strftime('%-m月 %-d日') })
    end
  end

  def set_address
        @address = Address.find_by(user_id: current_user.id)
  end
end
