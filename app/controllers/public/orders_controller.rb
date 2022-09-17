class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    order.save
    redirect_to address_path
  end

  def index
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    #address_numberの条件分岐
    if params[:order][:address_number] == 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_number] == 2
      @address = Address.find(params[:order][:address_id])
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = CartItem.all
    @orders = Order.all
    @total = 0
    #binding.pry
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
