class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|

      t.timestamps
    end
  end
end
