class Admin::OrdersController < ApplicationController
  
  def top
    @cart_items = CartItem.page(params[:page])
    @orders = Order.all
  end
  
  def show
  end

  def update
  end
  
  def confirm
  end
end
