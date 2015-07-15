module Github
  class WebhooksController < Github::Controller
    respond_to :json

    def push_event
      render_status :ok
    end
  end
end
