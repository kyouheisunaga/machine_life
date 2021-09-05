class AddUserIdToStockParts < ActiveRecord::Migration[5.2]
  def change
    add_column :stock_parts, :user_id, :integer, null: false, foreign_key: true
  end
end
