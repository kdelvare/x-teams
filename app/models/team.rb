class Team < ActiveRecord::Base
  has_and_belongs_to_many :mutants

  def disband
    update_attribute(:disbanded_at, Time.now)
  end

  def active?
    disbanded_at.nil?
  end

  def disbanded?
    !active?
  end

  scope :active, -> { where(disbanded_at: nil).order(:created_at) }
  scope :disbanded, -> { where.not(disbanded_at: nil).order(:created_at) }
end
