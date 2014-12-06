class TeamsController < ApplicationController
  def index
    @teams = Team.active
    @mutants = Mutant.free
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    binding.pry
    if @team.save
      redirect_to teams_url, notice: "Team sent!"
    else
      render :index
    end
  end

  private
  def team_params
    params.require(:team).permit(:mission, mutant_ids: [])
  end
end
