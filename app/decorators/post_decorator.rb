class PostDecorator < BaseDecorator
  def content
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {})
    markdown.render(body)
  end
end
