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
    end
  end
end
