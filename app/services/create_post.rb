require "net/http"

class CreatePost
  def initialize(file, authors = [])
    @file = file
    @authors = authors
  end

  def call
    post = Post.create(title: extracted_title, slug: @file.slug, body: remote_file_content, publication_date: Time.zone.today, authors: authors)

    ServiceCall.new(post, post.errors)
  end

  private

  def remote_file_content
    _remote_file_content ||= Net::HTTP.get(@file.uri)
  end

  def extracted_title
    remote_file_content.match(/^\s*#\s?(.+)/)&.captures&.first || ""
  end

  def authors
    _authors ||= @authors.map do |author|
      Author.find_or_initialize_by(email: author.email).initialize_with(name: author.name, username: author.username)
    end
  end
end
