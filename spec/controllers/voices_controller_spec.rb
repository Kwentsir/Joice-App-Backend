require 'rails_helper'
require 'spec_helper'
require 'devise'


RSpec.describe Api::V1::VoicesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { user_id: user.id, file_name: 'test_file', voice_file: 'test_file.mp3', date: Date.today } }
  let(:invalid_attributes) { { user_id: user.id, file_name: nil, voice_file: nil, date: nil } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Voice' do
        expect do
          post :create, params: { voice: valid_attributes }
        end.to change(Voice, :count).by(1)
      end

      it 'renders a JSON response with the new voice' do
        post :create, params: { voice: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_voice_url(Voice.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new voice' do
        post :create, params: { voice: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'without authentication' do
      before do
        sign_out user
      end

      it 'renders a JSON response with errors for the new voice' do
        post :create, params: { voice: valid_attributes }
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
