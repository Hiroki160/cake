class Public::HomesController < ApplicationController
  def top
    @items = Item.limit(3).order('id')
  end

  def about
  end
end
