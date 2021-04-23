class PlacesController < ApplicationController
  def create
    place = Place.new(place_params.merge!(user_id: current_user.id))

    if place.save
      render json: place, 
             serializer: Place::Create::PlaceSerializer, status: :created
    else
      render json: { errors: place.errors }, status: :unprocessable_entity
    end
  end

  def index
    if params[:list_type] == 'list'
      places = Place.all.order(name: :asc)

      render json: places, 
             each_serializer: Place::Index::List::PlaceSerializer, status: :ok
    else
      places = Place.by_distance(:origin => [params[:lat], params[:lng]])

      render json: places, 
             each_serializer: Place::Index::Map::PlaceSerializer, status: :ok
    end
  end

  def place_params
    params.require(:place).permit(:name, :lat, :lng)
  end
end
