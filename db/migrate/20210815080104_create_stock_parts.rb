class CreateStockParts < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_parts do |t|
      t.string  :stock_parts_name,        null: false
      t.string  :model,                   null: false
      t.string  :maker,                   null: false
      t.integer :stock,                   null: false
      t.integer :price,                   null: false
      t.text    :stock_parts_details_memo 

      t.timestamps
    end
  end
end
