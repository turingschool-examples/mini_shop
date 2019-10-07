class RemoveZipcodeFromMerchants < ActiveRecord::Migration[5.1]
  def change
    remove_column :merchants, :zipcode, :integer
  end
end
