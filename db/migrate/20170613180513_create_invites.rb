class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string      :email_address, :null => true
      t.bigint      :league_id
      t.bigint      :sender_id
      t.bigint      :recipient_id
      t.string      :token
      t.timestamps
    end
  end
end
