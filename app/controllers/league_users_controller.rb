class LeagueUsersController < ApplicationController

  # Require log in check before running method:
  before_action :logged_in_user

  def index
    @league_user = LeagueUser.all
  end

  def show
    @league_user = LeagueUser.find(params[:id])
  end

  def new
    @league_user = LeagueUser.new
  end

  # User joins a league:
  def create
    @league = League.find(params[:id])
    @league.users << current_user
  end

  def edit
  end

  def update
  end

  # User leaves a league:
  def destroy
  end

  private

  def league_user_params
    params.require(:league_user).permit(:league_id, :user_id)
  end

  # callback functions:


end
