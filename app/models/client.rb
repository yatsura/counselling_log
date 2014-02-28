class Client < ActiveRecord::Base
  validates_presence_of :code, :zone, :organisation_id

  belongs_to :organisation
  has_many :counselling_sessions

  def organisation_name
    self.organisation.name unless self.organisation.nil?
  end
end
