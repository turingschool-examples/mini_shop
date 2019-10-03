class AddColumnsToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :address, :string
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
    add_column :merchants, :zipcode, :integer
  end
end
