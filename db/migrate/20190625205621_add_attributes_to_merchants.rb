class AddAttributesToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :address, :string
    add_column :merchants, :city, :string
    add_column :merchants, :state, :string
    add_column :merchants, :zipcode, :string
  end
end
