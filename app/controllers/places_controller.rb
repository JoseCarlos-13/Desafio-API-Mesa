class PlacesController < ApplicationController
  def create
    place = Place.new(place_params)

    if place.save
      render json: place, 
             serializer: Place::Create::PlaceSerializer, status: :created
    else
      render json: { errors: place.errors }, status: :unprocessable_entity
    end
  end

  def place_params
    params.require(:place).permit(:name, :user_id)
  end
end
