class TopPosts::CLI
    def call
        TopPosts::API.create_articles
        TopPosts::API.create_authors
        puts "Welcome! Let's check out some DEV.to articles!"
        top_five
        menu
        goodbye
    end

     def top_five
         puts "Top 5 Most Popular Posts"
         puts ""
         TopPosts::Article.top_five
         puts ""
         puts "To get more info on a Top Five article, type article number."
         puts ""
         
     end

    def menu
        puts "To see a longer list of articles, type list."
        puts ""
        puts "To exit, type exit"
        input = gets.strip.downcase

    end

    def list_articles
        #puts "This will be a list"
        TopPosts::Article.list_all
    end
    
    def article_selection(article)
        puts ""
        puts "Which article would you like to see? Enter a number between 1 and 5:"
        input = gets.strip.to_i
    end

    def print_article_info
        puts ""
        
    end

    def goodbye
        puts "Come back next week for more content!"
    end
end