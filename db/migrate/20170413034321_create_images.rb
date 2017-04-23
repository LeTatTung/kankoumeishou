class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.string :address
      t.string :review
      t.string :description
      t.integer :like_number
<<<<<<< HEAD
<<<<<<< HEAD
      t.integer :user_id
      t.integer :category_id
=======
=======
>>>>>>> fe854935df007a8da07b1912bee37f3dac4787d5
      t.integer :category_id
      t.integer :user_id

>>>>>>> fe854935df007a8da07b1912bee37f3dac4787d5
      t.timestamps
    end
  end
end
