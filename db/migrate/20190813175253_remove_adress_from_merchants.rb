class RemoveAdressFromMerchants < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :address, :string
    remove_column :merchants, :state, :string
    remove_column :merchants, :zip, :string
  end
end
