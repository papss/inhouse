class LeagueUsers < ActiveRecord::Migration[5.1]
  def self.up
    create_table :league_users do |t|
      t.bigint :league_id, index: true
      t.bigint :user_id, index: true
      t.timestamps
    end
  end

  def self.down
    drop_table :league_users
  end
end
