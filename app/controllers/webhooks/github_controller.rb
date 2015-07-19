module Webhooks
  class GithubController < WebhookController
    respond_to :json

    def push_event
      render_status :ok
    end
  end
end
