class PlacesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @place = Place.new(place_params).save

    render json: @place, 
           serializer: Place::Create::PlaceSerializer, status: :created
  end

  def place_params
    params.require(:place).permit(:name, :user_id)
  end
end
