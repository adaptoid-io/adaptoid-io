require "rails_helper"

RSpec.describe Webhooks::GithubController do
  it { expect(post: "webhooks/github/push_event").to route_to("webhooks/github#push_event") }
end
