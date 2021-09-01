class CreateExchengeHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :exchenge_histories do |t|
      t.string :exchange_history, null: false
      t.integer :machine_part_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
