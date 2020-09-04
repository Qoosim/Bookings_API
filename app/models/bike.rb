class Bike < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates_presence_of :model, :color, :price, :weight, :engine_capacity
end
