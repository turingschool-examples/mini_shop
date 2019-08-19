class AddLastNameToMerchants < ActiveRecord::Migration[5.1]
  def change
    add_column :merchants, :last_name, :string
  end
end
