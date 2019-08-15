class AddCountryToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :country, :string
  end
end
