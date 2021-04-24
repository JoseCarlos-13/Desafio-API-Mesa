require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Places", type: :request do
  describe "POST #create" do
    context 'when the place is created' do
      it 'must return the 201 status code' do
        user = create(:user)
        place_params = attributes_for(:place, name: 'Patio Maceió', lat: -9.558020174564106, lng: -35.746253289850294, user_id: user.id)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
      end

      it 'must return the place created' do
        user = create(:user)
        place_params = attributes_for(:place, name: 'Patio Maceió', lat: -9.558020174564106, lng: -35.746253289850294, user_id: user.id)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
        expect(json_body[:user]).to have_key(:id)
        expect(json_body[:user]).to have_key(:name)
      end
    end

    context 'when the place is not created' do
      it 'must return the 422 status code' do
        user = create(:user)
        place_params = attributes_for(:place, lat: nil, lng: nil, name: nil, user_id: nil)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the 422 status code' do
        user = create(:user)
        place_params = attributes_for(:place, lat: nil, lng: nil, name: nil, user_id: nil)

        post "/places", params: { place: place_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe "GET #index" do
    context 'when the list is in alphabeat order' do
      it 'must return 200 status code' do
        user = create(:user)
        place_1 = create(:place, name: 'Hospital Metropolitano de Alagoas', lat: -9.558951204376811, lng: -35.76569394049623, user_id: user.id)
        place_2 = create(:place, name: 'Park Shop', lat: -9.553915149483348, lng: -35.75861290850986, user_id: user.id)
        place_3 = create(:place, name: 'Mercado Lider', lat: -9.568684544450356, lng: -35.75642422617252, user_id: user.id)
        list_params = { list_type: 'list' }

        get "/places", params: list_params, headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must return a list in alphabetic order' do
        user = create(:user)
        place_1 = create(:place, name: 'Hospital Metropolitano de Alagoas', lat: -9.558951204376811, lng: -35.76569394049623, user_id: user.id)
        place_2 = create(:place, name: 'Park Shop', lat: -9.553915149483348, lng: -35.75861290850986, user_id: user.id)
        place_3 = create(:place, name: 'Mercado Lider', lat: -9.568684544450356, lng: -35.75642422617252, user_id: user.id)
        list_params = { list_type: 'list' }

        get "/places", params: list_params, headers: get_headers(user)

        expect(json_body[0][:name]).to eq(place_1.name)
        expect(json_body[1][:name]).to eq(place_3.name)
        expect(json_body[2][:name]).to eq(place_2.name)
      end
    end

    context 'when the list is in map order' do
      it 'must return a list in map order' do
        user = create(:user)
        place_1 = create(:place, name: 'São Paulo', lat: -23.517304087332068, lng: -46.63105393831187, user_id: user.id)
        place_2 = create(:place, name: 'Alagoas', lat: -9.418265454411237, lng: -36.74967609282641, user_id: user.id)
        place_3 = create(:place, name: 'Bahia', lat: -12.043981969328177, lng: -41.67035605483432, user_id: user.id)
        list_params = { list_type: 'map', lat: -9.418265454411237, lng: -36.74967609282641 }

        get "/places", params: list_params, headers: get_headers(user)

        expect(json_body[0][:name]).to eq(place_2.name)
        expect(json_body[1][:name]).to eq(place_3.name)
        expect(json_body[2][:name]).to eq(place_1.name)
      end
    end
  end
end
