class AddActiveStatusToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :active_status, :boolean
  end
end
