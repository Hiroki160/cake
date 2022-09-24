class Admin::OrdersController < ApplicationController

  def top
    @orders = Order.all.page(params[:page])
    @order_details = OrderDetail.all
  
    # @cart_items = CartItem.page(params[:page])
    # @total = OrderDetails.all.sum(:amount)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
  end

  def confirm
  end
end
