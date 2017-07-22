class League < ApplicationRecord

  has_many :league_users
  has_many :users, :through => :league_users, dependent: :destroy

  has_many :seasons

  has_many :invites

end
