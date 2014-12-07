require 'rails_helper'

RSpec.describe Team, :type => :model do
  it { should have_and_belong_to_many(:mutants) }
  it { should have_many(:tasks) }

  describe "#disband" do
    it "should set disbanded_at" do
      team = Team.create
      team.disband
      expect(team.disbanded_at).to be
    end
  end

  describe "active scope" do
    it "should return only active teams" do
      team1 = Team.create
      team2 = Team.create
      team1.disband
      expect(Team.active).to eq([team2])
    end
  end
end
