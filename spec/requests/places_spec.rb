require 'rails_helper'
require 'support/json_body'
require 'support/request_helper'

RSpec.describe "Places", type: :request do
  describe "POST #create" do
    context 'when the place is created' do
      it 'must return the 201 status code' do
        user = create(:user)
        place_params = attributes_for(:place, user_id: user.id)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
      end

      it 'must return the place created' do
        user = create(:user)
        place_params = attributes_for(:place, user_id: user.id)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
      end
    end

    context 'when the place is not created' do
      it 'must return the 422 status code' do
        user = create(:user)
        place_params = attributes_for(:place, name: nil, user_id: nil)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the 422 status code' do
        user = create(:user)
        place_params = attributes_for(:place, name: nil, user_id: nil)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end
end
