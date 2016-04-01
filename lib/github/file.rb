require "uri"

module Github
  class File
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def slug
      name.split(".").first
    end

    def uri
      URI.parse([ENV["POSTS_URL"], "master", name].join("/"))
    end
  end
end
