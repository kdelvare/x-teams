class TeamsController < ApplicationController
  def index
    @mutants = Mutant.free
    @team = Team.new
    @teams = Team.active
    @disbanded = Team.disbanded
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_url, notice: "Team sent!"
    else
      render :index
    end
  end

  def update
    team = Team.find(params[:id])
    team.disband
    redirect_to teams_url, notice: "Mission successful!"
  end

  private
  def team_params
    params.require(:team).permit(:mission, mutant_ids: [])
  end
end
