class Supervisor < ActiveRecord::Base
  has_many :counselling_sessions
  validates_presence_of :name, :cost, :zone
end
