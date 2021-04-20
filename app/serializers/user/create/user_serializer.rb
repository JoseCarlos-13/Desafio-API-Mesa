class User::Create::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
