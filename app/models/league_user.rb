class LeagueUser < ApplicationRecord
  
  belongs_to :user
  belongs_to :league

  attr_accessor :league_admin

end
