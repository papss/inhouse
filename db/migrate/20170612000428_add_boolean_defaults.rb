class AddBooleanDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column :league_users, :league_admin, :boolean, default: false
    change_column :users, :site_admin, :boolean, default: false
  end
end
