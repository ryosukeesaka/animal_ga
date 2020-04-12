class AddTransferLandToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :transfer_land, :string
  end
end
