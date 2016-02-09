class Order < ActiveRecord::Base
  include LineItems

  belongs_to :user

  validates :user_id, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true

  enum delivery_time: { am8: 0, pm0: 1, pm2: 2, pm4: 3, pm6: 4, pm8: 5 }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
