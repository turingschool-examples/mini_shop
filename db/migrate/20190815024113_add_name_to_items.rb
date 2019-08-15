class AddNameToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :name, :string
    add_column :items, :description, :string
    add_column :items, :price, :integer
    #this will need to change
    add_column :items, :image, :string
    add_column :items, :inventory, :integer
    add_column :items, :active?, :boolean
    #this also might need to change
    add_column :items, :merchant_name, :string
  end
end
