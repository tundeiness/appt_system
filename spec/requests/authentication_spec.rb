require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:client) { User.create(email: 'client@example.com', password: 'password', role: :client) }
  let(:therapist) { User.create(email: 'therapist@example.com', password: 'password', role: :therapist) }
  let(:admin) { User.create(email: 'admin@example.com', password: 'password', role: :admin) }

  describe 'GET /client/sign_in' do
    it 'returns http success' do
      get client_sign_in_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /therapist/sign_in' do
    it 'returns http success' do
      get therapist_sign_in_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /admin/sign_in' do
    it 'returns http success' do
      get admin_sign_in_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users/sign_in' do
    context 'when client signs in' do
      it 'redirects to client dashboard' do
        post user_session_path, params: { user: { email: client.email, password: client.password } }
        expect(response).to redirect_to(client_dashboard_path)
      end
    end

    context 'when therapist signs in' do
      it 'redirects to therapist dashboard' do
        post user_session_path, params: { user: { email: therapist.email, password: therapist.password } }
        expect(response).to redirect_to(therapist_dashboard_path)
      end
    end

    context 'when admin signs in' do
      it 'redirects to admin dashboard' do
        post user_session_path, params: { user: { email: admin.email, password: admin.password } }
        expect(response).to redirect_to(admin_dashboard_path)
      end
    end
  end
end
