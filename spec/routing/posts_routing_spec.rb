require 'rails_helper'

describe PostsController do
  it { expect(get: 'posts/on-the-road').to route_to('posts#show', slug: 'on-the-road') }
end
