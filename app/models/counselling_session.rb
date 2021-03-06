class CounsellingSession < ActiveRecord::Base
  validates_presence_of :meetable_id, :zone, :date, :length

  belongs_to :meetable, :polymorphic => true

  def self.last_with(obj)
    where(:meetable => obj).order(:date => :desc).first
  end

  def client_id
    if self.meetable_type == "Client"
      self.meetable_id
    else
      nil
    end
  end
end
