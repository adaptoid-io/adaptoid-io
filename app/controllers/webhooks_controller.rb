class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def render_status(status)
    render nothing: true, status: status
  end
end
