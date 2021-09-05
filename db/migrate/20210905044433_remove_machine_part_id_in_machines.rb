class RemoveMachinePartIdInMachines < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :machine_part_id
  end
end
