class LeagueUser < ApplicationRecord

  belongs_to :user
  belongs_to :league

  attr_accessor :league_admin, :league_id, :user_id

  validates_uniqueness_of :user_id, :scope => :league_id

end
