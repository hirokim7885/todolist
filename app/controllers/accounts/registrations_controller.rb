# frozen_string_literal: true

class Accounts::RegistrationsController < Devise::RegistrationsController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account = Account.save
      redirect_to sign_in_path, notice: '新規登録しました。'
    else
        render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @current_account.update(account_params)
        redirect_to root_path, notice: '登録を更新しました。'
    else
        render 'edit', status: :unprocessable_entity
    end
  end


  def destroy
    @current_account.destroy
    redirect_to sign_in_path, notice: 'アカウントを消去しました。'
  end

  
  private
  def account_params
    params.require(:account).permit( :name, :email, :password)
  end

end
