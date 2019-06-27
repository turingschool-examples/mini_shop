class CreateItem < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image
      t.boolean :active
      t.integer :inventory
      t.string :merchant_name
    end
  end
end
