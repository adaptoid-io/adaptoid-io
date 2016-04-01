class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_signature

  private

  def render_status(status)
    render nothing: true, status: status
  end

  def verify_signature
    signature = "sha1=" + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), ENV["SECRET_TOKEN"], request.body.read)
    render_status(:error) unless Rack::Utils.secure_compare(signature, request.headers["HTTP_X_HUB_SIGNATURE"])
  end
end
