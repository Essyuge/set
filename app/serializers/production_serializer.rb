class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget, :image, :director, :ongoing
 has_many :cast_members
 has_many :tickets
 has_many :users, through: :tickets

end
