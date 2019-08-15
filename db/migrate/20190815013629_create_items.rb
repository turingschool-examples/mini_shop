class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :image
      t.boolean :active
      t.integer :inventory
      t.timestamps
    end
  end
end
