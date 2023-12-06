class AddGroupIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :group, null: false, foreign_key: true
  end
end
