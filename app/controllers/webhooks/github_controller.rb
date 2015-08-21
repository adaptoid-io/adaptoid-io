module Webhooks
  class GithubController < WebhookController
    respond_to :json

    def push_event
      update = QueuePostUpdates.new(params).call

      if update.success?
        render_status :ok
      else
        render_status :error
      end
    end
  end
end
