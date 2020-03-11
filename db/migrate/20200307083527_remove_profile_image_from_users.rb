class RemoveProfileImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :ProfileImage, :string
  end
end
