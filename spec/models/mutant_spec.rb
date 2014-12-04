require 'rails_helper'

RSpec.describe Mutant, :type => :model do
  it { should validate_presence_of(:name) }
end
