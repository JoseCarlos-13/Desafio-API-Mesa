require 'rails_helper'
require 'support/json_body.rb'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    context 'when the list is loaded' do
      it 'must return 200 status code' do
        users = create_list(:user, 2)

        get "/users"

        expect(response).to have_http_status(:ok)
      end

      it 'must return the users list' do
        users = create_list(:user, 2)

        get "/users"

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:name)
        expect(json_body[0]).to have_key(:email)
      end
    end
  end
end
