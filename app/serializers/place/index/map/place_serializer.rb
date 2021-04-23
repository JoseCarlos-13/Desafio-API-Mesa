class Place::Index::Map::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :lat, :lng
end
