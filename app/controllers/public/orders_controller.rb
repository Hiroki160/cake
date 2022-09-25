class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.with_tax_price
        order_detail.save
      end
    redirect_to orders_complete_path
    cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = current_customer.orders.all
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    # @orders = Order.all
    @order_details = @order.order_details.all
    @total = 0
  end

  def confirm
    @order = Order.new(order_params)
    @order.carriage = 800
    if params[:order][:payment_method] == "transfer"
    @order.payment_method = 1
    end
    #enumで数字を記述しているので、to_iでintegerに変える必要がある。f.radioは文字列で入ってくる
    #address_numberの条件分岐
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:address_id]) #Addressテーブルの中から、address_idを持ってくる
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_number] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @cart_items = CartItem.all
    @orders = Order.all
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :carriage)
  end

end
