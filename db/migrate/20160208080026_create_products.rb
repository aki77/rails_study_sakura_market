class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.string :product_image_id
      t.integer :price, null: false
      t.text :description, null: false, default: ''
      t.boolean :hidden, null: false, default: false
      t.integer :order, null: false, default: 0

      t.timestamps null: false
    end
  end
end
