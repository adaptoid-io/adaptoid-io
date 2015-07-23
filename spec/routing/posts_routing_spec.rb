require 'rails_helper'

describe PostsController do
  it { expect(get: 'posts/1').to route_to('posts#show', id: '1') }
end
