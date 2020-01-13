class TopPosts::User
    attr_accessor :name, :username, :twitter_username, :github_username, :website_url
    @@all = []
    
    def initialize(args)
        @name = args[0]["user"]["name"]
        @username = args[0]["user"]["username"]
        @twitter_username = args[0]["user"]["twitter_username"]
        @github_username = args[0]["user"]["github_username"]
        @website_url = args[0]["user"]["website_url"]
        @@all << self
    end

    def self.all
        @@all
    end
end