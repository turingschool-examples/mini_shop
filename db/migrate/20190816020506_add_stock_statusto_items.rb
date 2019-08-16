class AddStockStatustoItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :stock_status, :boolean
  end
end
