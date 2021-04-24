class Place::Create::PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :user

  def user
    { id: object.user.id, name: object.user.name }
  end
end
