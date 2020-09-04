class Bike < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  validates :model, :color, :price, :weight, :engine_capacity, presence: true, allow_nil: false, allow_blank: false
end
