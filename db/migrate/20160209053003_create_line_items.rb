class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id, null: false
      t.integer :cart_id, null: false
      t.integer :quantity, null: false, default: 1
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
