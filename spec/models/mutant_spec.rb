require 'rails_helper'

RSpec.describe Mutant, :type => :model do
  it { should have_and_belong_to_many(:teams) }
  
  it { should validate_presence_of(:name) }
end
