class RemoveEventIdFromGroups < ActiveRecord::Migration[7.1]
  def change
    remove_column :groups, :event_id
    
  end
end
