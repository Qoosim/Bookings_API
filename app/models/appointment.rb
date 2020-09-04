class Appointment < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :bike, foreign_key: :bike_id

  validates_presence_of :date, :time, :location, :user_id, :bike_id
end
