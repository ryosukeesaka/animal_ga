class AddUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user, foreign_key: true
    add_column :messages, :room, foreign_key: true
  end
end
