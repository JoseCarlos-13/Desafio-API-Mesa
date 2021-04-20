class User::Create::RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
end
