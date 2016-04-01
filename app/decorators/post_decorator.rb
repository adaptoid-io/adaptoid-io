class PostDecorator < BaseDecorator
  def content
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {})
    markdown.render(body)
  end

  def authors
    model.authors.pluck(:name).to_sentence
  end

  def publication_date
    model.publication_date.strftime("%-d %B")
  end
end
