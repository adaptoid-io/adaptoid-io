require "rails_helper"

RSpec.describe PostsController do
  it { expect(get: "posts").to route_to("posts#index") }
  it { expect(get: "posts/on-the-road").to route_to("posts#show", id: "on-the-road") }
end
