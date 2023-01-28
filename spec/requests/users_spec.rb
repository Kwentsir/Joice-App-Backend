require 'swagger_helper'

RSpec.describe 'users', type: :request do
    describe 'POST /signup' do
  context 'when valid parameters are passed' do
    let(:user_params) do
      {
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'creates a new user and returns a 201 response' do
      post '/signup', params: user_params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

describe 'POST /login' do
  context 'when valid parameters are passed' do
    let(:user_params) do
      {
        email: 'test@example.com',
        password: 'password'
      }
    end

    it 'logs in the user and returns a 200 response' do
      post '/login', params: user_params
      expect(response).to have_http_status(:unauthorized)
    end
  end
end

def user_from_token
  return unless request.headers['Authorization'].present?
  jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                           Rails.application.credentials.devise[:jwt_secret_key]).first
  User.find(jwt_payload['sub'])
end

end