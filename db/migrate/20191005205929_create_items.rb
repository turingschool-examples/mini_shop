class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image_url
      t.boolean :active
      t.string :inventory

      t.timestamps
    end
  end
end
