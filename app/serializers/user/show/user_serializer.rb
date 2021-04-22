class User::Show::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :image, :name
end
