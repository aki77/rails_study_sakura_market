class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.integer :user_id, null: false
      t.string :name, null: false, default: ''
      t.string :address, null: false, default: ''

      t.timestamps null: false
    end
  end
end
