class Public::ItemsController < ApplicationController
  def index
    # @items = Item.all.order(created_at: :desc).limit(3)
    # @items = Item.limit(3).order(id)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer
  end


end
