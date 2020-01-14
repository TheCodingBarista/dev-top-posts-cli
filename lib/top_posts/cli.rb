class TopPosts::CLI
    def call
        greeting
        menu
    end

    def greeting
        puts "Welcome! Let's check out some dev.to articles!"
        puts ""
    end

    def menu
        puts "Top 5 Most Popular Posts"
        input = nil
        puts "To see a longer list of articles, type list."
        puts ""
        puts "To exit, type exit"
        input = gets.strip.downcase
        
    end

    def list_articles
        puts "This will be a list"
    end
    
    def article_info(article)
        puts ""
        puts "Which article would you like to see? Enter a number between 1 and 5:"
        input = gets.strip.to_i
    end

    def goodbye
        puts "Come back next week for more content!"
    end
end