class CounsellingSession < ActiveRecord::Base
  validates_presence_of :client_id, :type, :date, :length
end
