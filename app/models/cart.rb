class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.where(product: product).first
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product: product)
      line_items << current_item
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def total_items
    line_items.sum(:quantity)
  end
end
