require 'rails_helper'

RSpec.describe Mutant, :type => :model do
  it { should have_and_belong_to_many(:teams) }

  it { should validate_presence_of(:name) }

  describe "assigned scope" do
    it "should return mutants currently assigned to a team" do
      mutant = Mutant.create(name: "mutant")
      team = Team.create
      team.mutants = [mutant]
      expect(Mutant.assigned).to eq([mutant])
    end

    it "should not return mutants never assigned" do
      mutant = Mutant.create(name: "mutant")
      expect(Mutant.assigned).to eq([])
    end

    it "should not return mutants assigned and disbanded" do
      mutant = Mutant.create(name: "mutant")
      team = Team.create
      team.mutants = [mutant]
      team.disband
      expect(Mutant.assigned).to eq([])
    end
  end

  describe "free scope" do
    it "should return mutants never assigned" do
      mutant = Mutant.create(name: "mutant")
      expect(Mutant.free).to eq([mutant])
    end

    it "should not return mutants currently assigned to a team" do
      mutant = Mutant.create(name: "mutant")
      team = Team.create
      team.mutants = [mutant]
      expect(Mutant.free).to eq([])
    end

    it "should return mutants assigned and disbanded" do
      mutant = Mutant.create(name: "mutant")
      team = Team.create
      team.mutants = [mutant]
      team.disband
      expect(Mutant.free).to eq([mutant])
    end
  end
end
