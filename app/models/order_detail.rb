class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def self.sumprice
    sum(:amount)
  end

end
