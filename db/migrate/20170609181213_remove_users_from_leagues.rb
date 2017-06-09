class RemoveUsersFromLeagues < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:leagues, :user, index: true, foreign_key: true)
  end
end
