class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :user_id, :bike_id, :date, :time, :location, presence: true
end
