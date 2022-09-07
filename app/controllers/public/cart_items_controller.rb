class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def create
    @cart_item = CartItem.new
    @cart_item.save(cart_item_params)
    redirect_to customers_my_page_path 
    # 注文確認ページにする
  end
end

private

def cart_item_params
  params.require(:cart_item).permit(:amoount, :cart_id)
end