class RemoveColumnFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :status, :string
    remove_column :items, :merchant_name, :string
  end
end
