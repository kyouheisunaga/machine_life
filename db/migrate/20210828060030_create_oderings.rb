class CreateOderings < ActiveRecord::Migration[5.2]
  def change
    create_table :oderings do |t|
      t.integer :machine_part_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
