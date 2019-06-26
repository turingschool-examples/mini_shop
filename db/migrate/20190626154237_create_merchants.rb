class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
