class AddTransferToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :transfer, :boolean
  end
end
