class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.date :delivery_date, null: false
      t.integer :delivery_time, null: false

      t.timestamps null: false
    end
  end
end
