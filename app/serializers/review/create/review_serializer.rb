class Review::Create::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user_id, :place_id
end
