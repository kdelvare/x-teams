class TeamsController < ApplicationController
  def index
    @teams = Team.active
    @task = Task.new
  end

  def disbanded
    @teams = Team.disbanded
  end

  def new
    @mutants = Mutant.free
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_url, notice: "Team formed!"
    else
      render :index
    end
  end

  def update
    team = Team.find(params[:id])
    team.disband
    redirect_to teams_url, notice: "Team done!"
  end

  private
  def team_params
    params.require(:team).permit(mutant_ids: [])
  end
end
