class DropInvitesTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :invites_tables
  end
end
