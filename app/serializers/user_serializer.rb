class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :password
  has_many :productions, through: :tickets
  has_many :tickets                   
end
