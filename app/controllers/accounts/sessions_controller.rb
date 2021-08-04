# frozen_string_literal: true

class Accounts::SessionsController < Devise::SessionsController
  
  devise_for :accounts, controllers: { sessions: 'accounts/sessions' }

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
