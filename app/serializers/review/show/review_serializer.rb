class Review::Show::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user, :place

  def user
    { id: object.user.id, name: object.user.name }
  end

  def place
    { id: object.place.id, name: object.place.name }
  end
end
