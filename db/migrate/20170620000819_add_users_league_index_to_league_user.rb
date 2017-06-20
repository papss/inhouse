class AddUsersLeagueIndexToLeagueUser < ActiveRecord::Migration[5.1]
  def change
    add_index :league_users, [ :user_id, :league_id ], unique: true
  end
end
