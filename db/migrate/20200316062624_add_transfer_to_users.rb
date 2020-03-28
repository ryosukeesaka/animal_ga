class AddTransferToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :transfer, :boolean
    add_column :users, :entry, :integer
  end
end
