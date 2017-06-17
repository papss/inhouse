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
    if @league.users.ids.include?(current_user.id)
      redirect_to(@league, :notice => "You're already a member of this league!")
    else
      @league_user = @league.users << current_user
    end
    respond_to do |format|
      if @league_user.save
        format.html { redirect_to(@league, :notice => "Successfully joined #{@league.name}") }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { redirect_to(@league, :notice => "Something went wrong!") }
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
  end

  private

  def league_user_params
    params.require(:league_user).permit(:league_id, :user_id)
  end

  # callback functions:


end
