class CreatePost
  def initialize(file)
    @file = file
  end

  def call
    post = Post.create(slug: @file.slug, publication_date: Time.zone.today)

    ServiceCall.new(post, post.errors)
  end
end
