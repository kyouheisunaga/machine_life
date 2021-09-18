class AddAdditionToMachines < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :addition, :integer, null: false
  end
end
