class Organisation < ActiveRecord::Base
  has_many :clients
  has_many :counselling_sessions, :through => :clients
  validates_presence_of :name
end
