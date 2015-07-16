module Github
  class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    respond_to :json

    def push_event
      render_status :ok
    end

    private

    def render_status(status)
      render nothing: true, status: status
    end
  end
end
