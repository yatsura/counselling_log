class CounsellingSession < ActiveRecord::Base
  validates_presence_of :meetable_id, :zone, :date, :length

  belongs_to :meetable, :polymorphic => true

  def self.last_for(obj)
    where(:meetable => obj).order(:date => :desc).first
  end
end
