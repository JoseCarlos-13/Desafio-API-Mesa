class Place::Index::List::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
end
