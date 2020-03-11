class CreatePosts < ActiveRecord::Migration[5.2]
    def change
        create_table :posts do |t|

        t.string :title
        t.string :body
        t.text :pet_name
        t.string :image_id
        t.integer :user_id
        t.integer :pet_age, null: false, default: "0"
        t.integer :pet_genre

        t.timestamps
    end
  end
end
