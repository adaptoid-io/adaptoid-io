require 'rails_helper'

describe Webhooks::GithubController do
  describe 'POST #push_event' do
    before { request.headers['HTTP_X_HUB_SIGNATURE'] = 'sha1=b19a37ca2bca00f46af0c9882fd6ddc4382b4bfb' }
    before { post :push_event, params }

    context 'with valid parameters' do
      let(:params) { { ref: 'refs/heads/master' } }

      it { expect(response).to have_http_status(:success) }
    end
  end
end
