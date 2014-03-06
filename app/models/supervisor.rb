class Supervisor < ActiveRecord::Base
  has_many :counselling_sessions
  validates_presence_of :name, :cost, :zone
  default_scope { where visible: true }

  before_create do
    self[:visible] = true
  end
end
