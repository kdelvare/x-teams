class TeamsController < ApplicationController
  def index
    @teams = Team.active
  end
end
