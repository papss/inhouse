class LeagueUser < ApplicationRecord

  belongs_to :user
  belongs_to :league

  attr_accessor :league_admin

  validates_uniqueness_of :user_id, :scope => :league_id

end
