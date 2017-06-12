class AddLeagueAdminToLeagueUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :league_users, :league_admin, :boolean
  end
end
