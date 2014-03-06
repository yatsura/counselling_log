class CounsellingSession < ActiveRecord::Base
  validates_presence_of :client_id, :zone, :date, :length

  belongs_to :meetable, :polymorphic => true

end
