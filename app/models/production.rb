class Production < ApplicationRecord
  has_many :cast_members
  has_many :tickets
  has_many :users, through: :tickets

   # Validations
   validates :title, presence: true
   validates :genre, presence: true
   validates :description, presence: true
   validates :budget, numericality: { greater_than_or_equal_to: 0 }
   validates :image, presence: true
   validates :director, presence: true
   validates :ongoing, inclusion: { in: [true, false] }
end
