class Mutant < ActiveRecord::Base
  validates :name, presence: true
end
