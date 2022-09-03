class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    redirect_to customers_my_page_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  def confirmation
  end

  def withdrawal
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
