class RemoveCountryFromMerchants < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :country, :string
  end
end
