class CreateMachineParts < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_parts do |t|
      t.integer :number_of_use,                             null: false
      t.integer :replacement_frequency_setting,             null: false
      t.integer :machine_parts_operating_time_accumulation, null: false
      t.text    :machine_parts_details_memo
      t.integer :exchange_announcement,                     null: false
      t.integer :order_announcement,                        null: false
      t.text    :replacement_procedure_memo
      t.integer :machine_id,                                null: false, foreign_key: true
      t.integer :stock_part_id,                             null: false, foreign_key: true

      t.timestamps
    end
  end
end
