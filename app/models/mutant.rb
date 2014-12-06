class Mutant < ActiveRecord::Base
  has_and_belongs_to_many :teams

  validates :name, presence: true, uniqueness: true

  scope :assigned, -> { joins(:teams).where(teams: { disbanded_at: nil }) }
  scope :free, -> { where.not(id: assigned) }
end
