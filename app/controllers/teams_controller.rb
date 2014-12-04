class TeamsController < ApplicationController
  def index
    @teams = Team.active
    @mutants = Mutant.free
  end
end
