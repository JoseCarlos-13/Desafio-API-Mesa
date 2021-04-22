class ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)

    if review.save
      render json: review, 
             serializer: Review::Create::ReviewSerializer, status: :created
    else
      render json: { errors: review.errors }, status: :unprocessable_entity
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :place_id)
  end
end