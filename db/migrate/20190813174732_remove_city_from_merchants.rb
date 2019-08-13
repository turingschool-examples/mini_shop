class RemoveCityFromMerchants < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :city, :string
  end
end
