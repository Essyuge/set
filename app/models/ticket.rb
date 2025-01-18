class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :production

   # Validations
   validates :production_id, presence: true
   validates :user_id, presence: true
   validates :price, presence: true, numericality: { greater_than: 0 }
end
