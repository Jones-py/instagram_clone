class AddUserIdToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :user_id, :int
  end
end
