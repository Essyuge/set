class User < ApplicationRecord
  has_many :tickets
  has_many :productions, through: :tickets

 # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
