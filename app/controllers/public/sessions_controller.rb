# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   customers_my_page_path
  end
  # before_action :configure_sign_in_params, only: [:create]
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
  

  # 退会しているかを判断するメソッド
  def reject_customer
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
      flash[:notice] = "退会済みです"
      redirect_to new_customer_registration_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end

end



  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

