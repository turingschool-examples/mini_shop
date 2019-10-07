class CreateItem < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.float :price
      t.string :descriptiotring
      t.float :price
      t.string :description
      t.boolean :active
      t.integer :inventory
    end
  end
end
