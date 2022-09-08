class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    # 注文確認ページにする
  end
end

private

def cart_item_params
  params.require(:cart_item).permit(:amoount, :cart_id)
end