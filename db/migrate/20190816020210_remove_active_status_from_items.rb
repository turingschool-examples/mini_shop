class RemoveActiveStatusFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :active_status, :boolean
  end
end
