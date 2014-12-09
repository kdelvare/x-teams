require 'rails_helper'

RSpec.describe TeamsController, :type => :controller do
  describe "GET #index" do
    it "assigns @teams" do
      team = Team.create
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the #index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #disbanded" do
    it "assigns @teams" do
      team = Team.create
      team.disband
      get :disbanded
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the #disbanded view" do
      get :disbanded
      expect(response).to render_template("disbanded")
    end
  end

  describe "GET #new" do
    it "assigns @mutants" do
      mutant = Mutant.create(name: "mutant")
      get :new
      expect(assigns(:mutants)).to eq([mutant])
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template("new")
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
