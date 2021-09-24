class AddUserIdToMachineParts < ActiveRecord::Migration[5.2]
  def change
    add_column :machine_parts, :user_id, :integer, null: false, foreign_key: true
  end
end
