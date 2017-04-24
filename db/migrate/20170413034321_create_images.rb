class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.string :address
      t.string :review
      t.string :description
      t.integer :like_number
      t.integer :user_id

      t.timestamps
    end
  end
end
