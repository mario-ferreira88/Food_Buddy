class RemoveNullClauseFromRestaurantId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :restaurant_id, true
  end
end
