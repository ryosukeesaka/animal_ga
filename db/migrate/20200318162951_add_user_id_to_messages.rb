class AddUserIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :user, :refarences, foreign_key: true
    add_column :messages, :room, :refarences, foreign_key: true
  end
end
