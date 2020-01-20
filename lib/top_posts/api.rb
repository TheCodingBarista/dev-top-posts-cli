class TopPosts::API
    
    def self.get_page
        url = "https://dev.to/api/articles?key=z2syANA9RkwS29rT86aAg3q2"
        response = JSON.parse(RestClient.get(url))
    end
      
    def self.create_articles
        self.get_page.each do |hash|
          article = {
            :title => hash["title"],
            :description => hash["description"],
            :url => hash["url"],
            :tags => hash["tag_list"],
            :author => hash["user"]["name"]
          }
        TopPosts::Article.new(article)
        end 
    end

    def self.create_authors
      self.get_page.each do |hash|
        author = {
          :name => hash["user"]["name"],
          :username => hash["user"]["username"],
          :website => hash["user"]["website_url"]
        }
      TopPosts::Author.new(author)
      end 
    end
end