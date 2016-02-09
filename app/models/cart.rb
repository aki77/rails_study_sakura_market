class Cart < ActiveRecord::Base
  include LineItems

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
end
