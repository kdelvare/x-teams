class Team < ActiveRecord::Base
  has_and_belongs_to_many :mutants

  def disband
    update_attribute(:disbanded_at, Time.now)
  end

  scope :active, -> { where(disbanded_at: nil) }
end
