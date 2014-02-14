class Supervisor < ActiveRecord::Base
  validates_presence_of :name, :cost, :type
end
