class AddDefaultValuetoActiveStatus < ActiveRecord::Migration[5.1]
  def up
    change_column :items, :active_status, :boolean, default: true
  end

  def down
    change_column :items, :active_status, :boolean, default: false
  end
end
