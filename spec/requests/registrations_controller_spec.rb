require 'rails_helper'
require 'support/json_body.rb'

RSpec.describe "RegistrationsController", type: :request do
  describe "POST #create" do
    context 'when the user is created' do
      it 'must return 201 status code' do
        user_params = attributes_for(:user)

        post "/auth", params: user_params

        expect(response).to have_http_status(:created)
      end

      it 'must return the user created' do
        user_params = attributes_for(:user)

        post "/auth", params: user_params

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
        expect(json_body).to have_key(:email)
      end
    end

    context 'when the user is not created' do
      it 'must return the 422 status code' do
        user_params = attributes_for(:user, name: nil, email: nil, password: nil)

        post "/auth", params: user_params

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        user_params = attributes_for(:user, name: nil, email: nil, password: nil)

        post "/auth", params: user_params

        expect(json_body).to have_key(:errors)
      end
    end
  end
end
