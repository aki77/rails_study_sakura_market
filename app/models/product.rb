class Product < ActiveRecord::Base
  attachment :product_image, type: :image

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 1_000_000 },
                    presence: true
  validates :description, presence: true
  validates :order, presence: true
end
