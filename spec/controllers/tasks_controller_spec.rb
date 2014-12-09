require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
  describe "POST #create" do
    it "creates a task" do
      expect{ post :create, task: { description: "description", team: Team.create } }.to change(Task, :count).by(1)
    end

    it "redirects to teams" do
      post :create, task: { description: "description", team: Team.create }
      expect(response).to redirect_to(teams_path)
    end
  end
end
