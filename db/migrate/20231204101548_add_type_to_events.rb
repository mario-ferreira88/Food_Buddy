class AddTypeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :type, :string, default: 'Event'
    add_reference :events, :group

    drop_table :group_events
  end
end
