class Bike < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  belongs_to :user

  validates_presence_of :model, :color, :price, :weight, :engine_capacity, :user_id
end
