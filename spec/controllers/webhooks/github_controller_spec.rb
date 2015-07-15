require 'rails_helper'

describe Webhooks::GithubController do
  describe 'POST #push_event' do
    before { post :push_event, params, format: :json }

    context 'with valid parameters' do
      let(:params) { { event: { foo: 'bar' } } }

      it { expect(response).to have_http_status(:success) }
    end
  end
end
