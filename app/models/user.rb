class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :bikes, through: :appointments
  
  has_secure_password
end
