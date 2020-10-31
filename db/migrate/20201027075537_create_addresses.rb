class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,     null: false
      t.integer :ship_region_id, null: false
      t.string :ship_city,       null: false
      t.string :ship_block,      null: false
      t.string :ship_building
      t.string :phone,        null: false
      t.references :order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
