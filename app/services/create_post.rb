require "net/http"

class CreatePost
  def initialize(file)
    @file = file
  end

  def call
    post = Post.create(slug: @file.slug, body: remote_file_content, publication_date: Time.zone.today)

    ServiceCall.new(post, post.errors)
  end

  private

  def remote_file_content
    Net::HTTP.get(@file.uri)
  end
end
