class SessionsController < ApplicationController
  include SessionsHelper
  before_action :current_shop
  before_action :require_sign_in!
  helper_method :signed_in?
  skip_before_action :require_sign_in!, only: %i[new create]
  before_action :set_shop, only: [:create]
  def new; end

  # def create
  #   if @shop.authenticate(session_params[:password])
  #     sign_in(@shop)
  #     redirect_to root_path
  #   else
  #     flash.now[:danger] = t('.flash.invalid_password')
  #     render 'home/index'
  #   end
  # end

  # def destroy
  #   cookies.delete(:shop_remember_token)
  #   redirect_to root_path
  # end

  private

  # def set_shop
  #   @shop = Shop.find_by!(email: session_params[:email])
  # rescue StandardError
  #   flash.now[:danger] = t('.flash.invalid_email')
  #   render action: 'new'
  # end

  def session_params
    params.require(:session).permit(:auth_id, :password)
  end
end
