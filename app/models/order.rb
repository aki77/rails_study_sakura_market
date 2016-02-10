class Order < ActiveRecord::Base
  include LineItems

  belongs_to :user

  attr_accessor :delivery_days

  validates :user_id, presence: true
  validates :delivery_time, presence: true
  validates :delivery_days, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 14 },
                            presence: true

  enum delivery_time: { am8: 0, pm0: 1, pm2: 2, pm4: 3, pm6: 4, pm8: 5 }

  after_validation :delivery_days2delivery_date

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  private

    def delivery_days2delivery_date
      self.delivery_date = delivery_days.to_i.business_day.from_now
    end
end
