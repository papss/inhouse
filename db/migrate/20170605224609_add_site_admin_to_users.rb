class AddSiteAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :site_admin, :boolean
  end
end
