class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image
      t.string :status, default: 'Active'
      t.integer :inventory
      t.references :merchant, foreign_key: true
    end
  end
end
