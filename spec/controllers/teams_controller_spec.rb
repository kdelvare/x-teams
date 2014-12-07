require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  describe "GET #index" do
    it "assigns @teams" do
      team = Team.create
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "assigns @mutants" do
      mutant = Mutant.create(name: "mutant")
      get :index
      expect(assigns(:mutants)).to eq([mutant])
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST #create" do
    it "create a team" do
      expect{ post :create, team: { created_at: Time.now } }.to change(Team, :count).by(1)
    end

    it "redirects to index" do
      post :create, team: { created_at: Time.now }
      expect(response).to redirect_to(teams_path)
    end
  end
end
