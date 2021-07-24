# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController
  
  # before_action :configure_sign_in_params, only: [:create]

  devise_for :accounts, controllers: { sessions: 'accounts/sessions' }

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

  def new
    @account = account.find.new(params[:id])
  end

  def create
    @account = account.find.new(params[:id])
    if @account = current_account
      redirect_to lists_path, notice: 'ログインしました。'
    else
        render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to sign_in_path, notice: 'ログアウトしました'
  end

end
