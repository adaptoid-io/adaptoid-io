require "net/http"

class CreatePost
  def initialize(file)
    @file = file
  end

  def call
    post = Post.create(title: extracted_title, slug: @file.slug, body: remote_file_content, publication_date: Time.zone.today)

    ServiceCall.new(post, post.errors)
  end

  private

  def remote_file_content
    _remote_file_content ||= Net::HTTP.get(@file.uri)
  end

  def extracted_title
    remote_file_content.match(/^\s*#\s?(.+)/)&.captures&.first || ""
  end
end
