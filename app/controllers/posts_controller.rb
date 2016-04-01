class PostsController < ApplicationController
  def index
    @posts = Post.all.map { |post| PostDecorator.new(post) }
  end

  def show
    @post = PostDecorator.new(Post.find_by!(slug: params[:id]))
  end
end
