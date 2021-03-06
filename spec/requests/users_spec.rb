require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Users", type: :request do
  describe "PUT #update" do
    context 'when the user is updated' do
      it 'must return 204 status code' do
        user = create(:user)
        user_params = { email: 'janedoe@gmail.com', password: '987654321' }

        put "/users/#{user.id}", params: { user: user_params }, headers: get_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the user is not updated' do
      it 'must return 422 status code' do
        user = create(:user)
        user_params = { email: nil, password: nil }

        put "/users/#{user.id}", params: { user: user_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return errors message' do
        user = create(:user)
        user_params = { email: nil, password: nil }

        put "/users/#{user.id}", params: { user: user_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe "GET #show" do
    context 'when show the user' do
      it 'must return 200 status code' do
        user = create(:user)

        get "/users/#{user.id}", headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must return the user' do
        user = create(:user)

        get "/users/#{user.id}", headers: get_headers(user)

        expect(json_body).to have_key(:name)
        expect(json_body).to have_key(:email)
        expect(json_body).to have_key(:image)
      end
    end
  end
end
