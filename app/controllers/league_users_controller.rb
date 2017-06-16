class LeagueUsersController < ApplicationController

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

end
