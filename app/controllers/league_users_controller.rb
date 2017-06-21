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
    @league_user = LeagueUser.new(params[:league_user_params])
    @league_user.league = League.find(params[:league_id])
    @league_user.user = current_user
    respond_to do |format|
      if @league_user.save
        format.html { redirect_to league_url(@league_user.league, :notice => "Successfully joined #{@league_user.league.name}") }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { redirect_to(@league_user.league, :notice => "Something went wrong!") }
        format.json { render json: @league_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  # User leaves a league:
  def destroy
    @league_user = current_user.league_users.find(params[:league_id])
    @league_user.destroy
    if @league_user.destroy
      respond_to do |format|
        format.html { redirect_to league_url(@league), :notice => "You have left #{league.name}" }
        format.json { head :no_content }
      end
    end
  end

  private

  def league_user_params
    params.require(:league_user).permit(:league_id, :user_id, :league_admin)
  end

  # callback functions:


end
