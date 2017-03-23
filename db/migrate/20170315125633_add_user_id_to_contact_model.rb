class AddUserIdToContactModel < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :user_id, :integer
    add_column :messages, :group_id, :integer
  end
end
