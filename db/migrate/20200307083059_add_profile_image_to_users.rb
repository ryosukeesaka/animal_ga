class AddProfileImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ProfileImage, :string
  end
end
