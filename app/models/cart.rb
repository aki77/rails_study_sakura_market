class Cart < ActiveRecord::Base
  include LineItems

  def add_product(product, quantity)
    current_item = line_items.find_or_initialize_by(product: product)
    current_item.quantity += quantity.to_i
    current_item
  end

  def remove_product(product)
    line_items.find_by(product: product)&.destroy
  end
end
