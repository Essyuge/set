class CastMember < ApplicationRecord
  belongs_to :production

   # Validations
   validates :name, presence: true
   validates :role, presence: true
   validates :production_id, presence: true
end
