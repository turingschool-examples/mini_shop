class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :zip
    end
  end
end
