class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :price
      t.string :image
      t.boolean :status
      t.integer :inventory
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
