class ChangeQuantityOfLineItems < ActiveRecord::Migration
  def change
    change_column :line_items, :quantity, :integer, null: false, default: 0
  end
end
