require 'rails_helper'
require 'support/request_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST #new" do
    context 'when the user is logged' do
      it 'must return 200 status code' do
        user = create(:user)
        user_params = { email: user.email, password: user.password }

        post "/auth/sign_in", params: user_params

        expect(response).to have_http_status(:ok)
      end

      it 'must return user logged' do
        user = create(:user)
        user_params = { email: user.email, password: user.password }

        post "/auth/sign_in", params: user_params
        
        expect(json_body[:data]).to have_key(:email)
        expect(json_body[:data]).to have_key(:name)
      end
    end

    context 'when the user is not logged' do
      it 'must return 401 status code' do
        user_params = { email: 'john doe', password: 'john doe' }

        post "/auth/sign_in", params: user_params

        expect(response).to have_http_status(:unauthorized) 
      end
    end
  end

  describe "DELETE #destroy" do
    context 'when the user log out' do
      it 'must return 204 status code' do
        user = create(:user)

        delete "/auth/sign_out", headers: get_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
