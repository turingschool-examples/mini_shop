class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image
      t.boolean :active_status
      t.integer :inventory
      t.integer :merchant_id
    end
  end
end
