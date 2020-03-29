class AddUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user,null: false, foreign_key: true
    add_column :messages, :room,null: false,  foreign_key: true
  end
end
