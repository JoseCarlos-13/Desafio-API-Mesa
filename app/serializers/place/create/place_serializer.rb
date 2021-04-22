class Place::Create::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
