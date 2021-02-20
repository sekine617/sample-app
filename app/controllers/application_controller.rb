class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  helper_method :current_cart

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def set_search
    @search = Product.ransack(params[:q])
    @results = @search.result
  end

  //
    def current_shop
    remember_token = Shop.encrypt(cookies[:shop_remember_token])
    @current_shop ||= Shop.find_by(remember_token: remember_token)
  end

  def sign_in(shop)
    remember_token = Shop.new_remember_token
    cookies.permanent[:shop_remember_token] = remember_token
    shop.update!(remember_token: Shop.encrypt(remember_token))
    @current_shop = shop
  end

  def sign_out
    @current_shop = nil
    cookies.delete(:shop_remember_token)
  end

  def signed_in?
    @current_shop.present?
  end

  private

    def require_sign_in!
      redirect_to shop_login_path unless signed_in?
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[last_name first_name last_hurigana first_hurigana])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
