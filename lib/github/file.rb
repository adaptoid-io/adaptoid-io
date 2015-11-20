module Github
  class File
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def slug
      name.split('.').first
    end
  end
end
