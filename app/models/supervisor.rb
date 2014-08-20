class Supervisor < ActiveRecord::Base
  has_many :counselling_sessions, :as => :meetable
  validates_presence_of :name, :cost, :zone
  default_scope { where visible: true }

  before_create do
    self[:visible] = true unless self[:visible] == false
  end

  def code
    self.name
  end
end
