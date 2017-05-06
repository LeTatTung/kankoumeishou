class CreateLikeImages < ActiveRecord::Migration[5.0]
  def change
    create_table :like_images do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
    add_index :like_images, :user_id
    add_index :like_images, :image_id
    add_index :like_images, [:user_id, :image_id], unique: true
  end
end
