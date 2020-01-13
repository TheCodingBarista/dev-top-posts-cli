class TopPosts::ApiService

    def self.get_articles
        url = "https://dev.to/api/articles?key=z2syANA9RkwS29rT86aAg3q2"
        response = RestClient.get(url)
        TopPosts::Article.new(JSON.parse(response))
    end
   # def self.get_user
   #     url = "https://dev.to/api/articles?key=z2syANA9RkwS29rT86aAg3q2"
   #     response = HTTParty.get(url)
   #     TopPosts::User.new(response.parsed_response)
   # end
end