class Item < ApplicationRecord

  def with_tax_price
    (price * 1.1).floor
  end

has_one_attached :image
belongs_to :genre
has_many :orders, dependent: :destroy
has_many :cart_items, dependent: :destroy

validates :image, presence: true
validates :name, presence: true
validates :introduction, presence: true
validates :genre_id, presence: true
validates :price, presence: true
validates :is_active, presence: true
end




