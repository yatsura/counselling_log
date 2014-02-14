class Client < ActiveRecord::Base
  validates_presence_of :code, :type, :organisation_id
end
