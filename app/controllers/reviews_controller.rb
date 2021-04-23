class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params.merge!(user_id: current_user.id))

    if review.save
      render json: review, 
             serializer: Review::Create::ReviewSerializer, status: :created
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  def show
    review = Review.find(params[:id])

    render json: review, serializer: Review::Show::ReviewSerializer, status: :ok
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :place_id)
  end
end
