class RemoveTransferFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :transfer, :boolean
  end
end
