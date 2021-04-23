require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Reviews", type: :request do
  describe "POST #create" do
    context 'when the user create a review about a place' do
      it 'must return a 201 status code' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review_params = attributes_for(:review, user_id: user.id, place_id: place.id)

        post "/reviews", params: { review: review_params }, headers: get_headers(user)
        
        expect(response).to have_http_status(:created)
      end

      it 'must return a review created' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review_params = attributes_for(:review, user_id: user.id, place_id: place.id)

        post "/reviews", params: { review: review_params }, headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:rating)
        expect(json_body).to have_key(:comment)
        expect(json_body).to have_key(:user_id)
        expect(json_body).to have_key(:place_id)
      end
    end

    context 'when the review is not created by the user ' do
      it 'must return 422 status code' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review_params = attributes_for(:review, rating: nil, comment: nil, user_id: nil, place_id: nil)

        post "/reviews", params: { review: review_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return a review errors' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review_params = attributes_for(:review, rating: nil, comment: nil, user_id: nil, place_id: nil)

        post "/reviews", params: { review: review_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe "GET #show" do
    context "when the user see the place review" do
      it 'must return 200 status code' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review = create(:review, user_id: user.id, place_id: place.id)

        get "/reviews/#{review.id}", headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must return the selected review' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        review = create(:review, user_id: user.id, place_id: place.id)

        get "/reviews/#{review.id}", headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:rating)
        expect(json_body).to have_key(:comment)
        expect(json_body).to have_key(:user)
        expect(json_body).to have_key(:place)
      end
    end
  end
end
