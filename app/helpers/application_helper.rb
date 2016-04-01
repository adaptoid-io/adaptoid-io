module ApplicationHelper
  def slugged_post_path(post)
    post_path(id: post.slug)
  end

  def slugged_post_url(post)
    post_url(id: post.slug)
  end
end
