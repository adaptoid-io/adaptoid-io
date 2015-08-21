class QueuePostUpdates
  def initialize(params)
    @params = params
    @result = ServiceCall.new
  end

  def call
    parse_data.files.added.each { |file| CreatePost.new(file).call }

    @result
  end

  private

  def parse_data
    Github::Webhooks::PushEvent.parse(@params)
  rescue Github::Webhooks::PushEvent::Parser::ParseError => error
    @result.errors << error
  end
end
