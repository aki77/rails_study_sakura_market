class Product < ActiveRecord::Base
  attachment :product_image, type: :image

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 1_000_000 },
                    presence: true
  validates :description, presence: true
  validates :order, presence: true

  scope :visible, -> { where(hidden: false) }

  SORTS = {
    'order asc'       => 'おすすめ順',
    'created_at desc' => '新着順',
    'created_at asc'  => '古い順',
    'price asc'       => '金額の安い順',
    'price desc'      => '金額の高い順',
  }.freeze
end
