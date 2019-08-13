class CreateMerchant < ActiveRecord::Migration[5.1]
  def change
    create_table :merchant do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
