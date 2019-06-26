class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :image_url
      t.integer :status
      t.integer :inventory
      t.string :merchant_name
    end
  end
end
