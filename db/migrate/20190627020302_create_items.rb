class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image
      t.string :status
      t.integer :inventory
      t.string :merchant_name
      t.timestamps
    end
  end
end
