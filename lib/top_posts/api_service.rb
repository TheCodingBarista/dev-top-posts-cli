class TopPosts::ApiService

    def self.get_articles
        url = "https://dev.to/api/articles?key=z2syANA9RkwS29rT86aAg3q2"
        response = RestClient.get(url)
        page = (JSON.parse(response))
        binding.pry
        articles = []

        page.each do |article|
            title = article["title"].gsub(/"/, '')
            description = article["description"]
                if  description.size == 0
                    description = "This article has no description."
                end
            url = article["url"]
            tags = article["tag_list"]
            
            article_hash = {
                :title => title,
                :description => description,
                :url => url,
                :tags => tags
            }
        articles << article_hash
        end
        articles
    end

    def self.get_users
        url = "https://dev.to/api/articles?key=z2syANA9RkwS29rT86aAg3q2"
        response = RestClient.get(url)
        page = (JSON.parse(response))
        users = []

        page.each do |article|
            user = article["user"]
               name = user["name"]
               username = user["username"]
               website_url = user["website_url"]
                if website_url == nil
                    website_url = "This user does not have a website."
                end
            
                user_hash = {
                    :name => name,
                    :username => username,
                    :website_url => website_url
             }
        users << user_hash
        end
        users
    end

end