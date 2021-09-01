class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string  :video,           null: false
      t.integer :machine_part_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
