class TopPosts::CLI
    def call
        TopPosts::API.create_articles
        TopPosts::API.create_authors
        puts "Welcome! Let's check out some DEV.to articles!"
        puts ""
        top_five
        menu
    end

     def top_five
         puts "Top 5 Most Popular Posts"
         puts ""
         TopPosts::Article.top_five
         puts ""
     end

    def menu
        puts "To see full list of articles, type 'list'"
        puts ""
        puts "To get more information on an article, type 'more info'"
        puts ""
        puts "To exit, type 'exit'"
        input = gets.strip.downcase        
        case input
        when 'list'
            list_articles
        when 'more info'
            article_selection
        when 'exit'
            goodbye
        else
            puts "Sorry, please try again."
            menu
        end
    end

    def list_articles
        TopPosts::Article.list_all
        puts ""
        menu
    end
    
    def article_selection
        puts "Which article would you like more info on? Please enter the article number"
        input = gets.strip.to_i - 1
        TopPosts::Article.article_info(input)
    end

    def print_article_info
        puts ""

    end

    def goodbye
        puts "Come back next week for more content!"
    end
end