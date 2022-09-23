class Admin::OrdersController < ApplicationController

  def top
    # @cart_items = CartItem.page(params[:page])
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.all
  end

  def update
  end

  def confirm
  end
end
