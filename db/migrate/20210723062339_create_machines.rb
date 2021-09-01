class CreateMachines < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string  :machine_name,                        null: false, unique: true
      t.integer :machine_operating_time_accumulation, null: false
      t.integer :user_id,                             null: false, foreign_key: true
      t.integer :machine_part_id,                     null: false, foreign_key: true

      t.timestamps
    end
  end
end
