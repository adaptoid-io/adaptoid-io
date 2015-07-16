require 'rails_helper'

describe Github::WebhooksController do
  it { expect(post: 'github/webhooks/push_event').to route_to('github/webhooks#push_event') }
end
