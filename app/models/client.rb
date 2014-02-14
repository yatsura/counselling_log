class Client < ActiveRecord::Base
  validate_presence_of :code, :type, :organisation_id
end
