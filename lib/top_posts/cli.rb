class TopPosts::CLI
    def call
        greeting
        list_articles
        goodbye
    end

    def greeting
        puts "Welcome! Let's check out some dev.to articles!"
    end

    def list_articles
        puts "This will be a list"
    end


    def goodbye
        puts "Come back next week for more content!"
    end
end