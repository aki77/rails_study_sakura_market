class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :diary_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
