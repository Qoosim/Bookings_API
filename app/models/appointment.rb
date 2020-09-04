class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates_presence_of :user_id, :bike_id, :date, :time, :location
end
