class RemoveStockStatusFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :stock_status, :boolean
  end
end
