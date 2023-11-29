class AddOwnerToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :owner, foreign_key: { to_table: :users }
  end
end
