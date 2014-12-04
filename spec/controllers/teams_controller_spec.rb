require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  describe "GET #index" do
    it "assigns @teams" do
      team = Team.create
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "only shows active teams" do
      team = Team.create
      team.disband
      get :index
      expect(assigns(:teams)).to eq([])
    end
  end
end
