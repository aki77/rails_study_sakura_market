class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :title, null: false, default: ''
      t.text :body, null: false, default: ''
      t.string :diary_image_id
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
