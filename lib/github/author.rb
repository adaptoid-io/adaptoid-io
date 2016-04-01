module Github
  class Author
    attr_reader :name, :email, :username

    def initialize(name, email, username)
      @name = name || ""
      @email = email || ""
      @username = username || ""
    end
  end
end
