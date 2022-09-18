class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @customer = current_customer
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
    # 注文確認ページにする
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

end

private

def cart_item_params
  params.require(:cart_item).permit(:amount, :cart_id, :item_id)
end