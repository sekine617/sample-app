class ShopsController < ApplicationController
  #skip_before_action :require_sign_in!, only: [:new, :create, :show]
  #before_action :require_sign_in!, only: [:order_index]

  def show
    @shop_img = Photo.find_by(id: 4)
    @shop = Shop.find_by(id: params[:id])
    @products = Product.where(shop_id: params[:id])
    @products = @products.page(params[:page])
  end

  def new
    @shop = Shop.new(flash[:shop])
  end

  def create
    shop = Shop.new(shop_params)
    if shop.save
      session[:shop_id] = shop.id
      redirect_to mypage_path
    else
      redirect_back fallback_location: root_path,
                    flash: {
                      shop: shop,
                      error_messages: shop.errors.full_messages
                    }
    end
  end

  def me; end

  def order_index
    today = Date.current
    @shop_id = params[:id]
   #Order.joins(:order_products).select("orders.*, order_products.*").where(receipt_date: '2021-02-25').where(order_products: { shop_id: 9 }).first.price
    @orders_of_today = Order.joins(:order_products).select("orders.*, order_products.*").where(receipt_date: '2021-02-25' , order_products: { shop_id: 9 })
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :auth_id, :password, :password_confirmation, :phone_number,
                                 :opening_hours, :address)
  end
end
