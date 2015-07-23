class PostsController < ApplicationController
  def show
    @post = PostDecorator.new(Post.find_by(slug: params[:slug]))
  end
end
