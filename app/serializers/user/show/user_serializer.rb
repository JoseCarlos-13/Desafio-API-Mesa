class User::Show::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
end
