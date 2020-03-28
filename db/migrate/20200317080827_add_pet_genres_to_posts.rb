class AddPetGenresToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :pet_genres, :string
  end
end
