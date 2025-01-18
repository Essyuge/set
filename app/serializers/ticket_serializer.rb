class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price
  belongs_to :user
  belongs_to :production

end