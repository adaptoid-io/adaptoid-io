class PostsController < ApplicationController
  def show
    @post = PostDecorator.new(Post.first)
  end
end
