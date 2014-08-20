class Client < ActiveRecord::Base
  validates_presence_of :code, :zone, :organisation_id

  default_scope { where visible: true }
  belongs_to :organisation
  has_many :counselling_sessions, :as => :meetable

  before_create do
    self[:visible] = true unless self[:visible] == false
  end
  
  def organisation_name
    self.organisation.name unless self.organisation.nil?
  end
end
