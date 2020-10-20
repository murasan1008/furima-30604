class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name,                   null: false
      t.text :description,            null: false
      t.integer :genre_id,            null: false
      t.integer :status_id,           null: false
      t.integer :ship_burden_id,      null: false
      t.integer :shipment_source_id,  null: false
      t.integer :days_to_id,          null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
