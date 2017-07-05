class LeagueUser < ApplicationRecord

  belongs_to :user
  belongs_to :league

  attr_accessor :league_admin, :league_id, :user_id

  validates_uniqueness_of :league_id, :scope => :user_id

end
