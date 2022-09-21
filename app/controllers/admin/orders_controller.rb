class Admin::OrdersController < ApplicationController
  
  def top
    # @cart_items = CartItem.page(params[:page])
    @order_details = OrderDetail.all
  end
  
  def show
  end

  def update
  end
  
  def confirm
  end
end
