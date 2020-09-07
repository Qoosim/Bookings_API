class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :bikes, through: :appointments
  has_many :bikes
  
  validates_presence_of :name, :email, :password_digest
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password

  def to_admin
    update(admin: true)
  end
end
