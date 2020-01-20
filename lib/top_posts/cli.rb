class TopPosts::CLI
    def call
        TopPosts::API.create_articles
        TopPosts::API.create_authors
        puts ""
        puts "Welcome! Let's check out some DEV.to articles!"
        puts ""
        top_five
        menu
    end

     def top_five
         TopPosts::Article.top_five
         puts ""
    end

    def menu
        puts "To see full list of articles, type 'list'"
        puts ""
        puts "To get more information on an article, type 'more info'"
        puts ""
        puts "To exit, type 'exit'"
        puts ""
        input = gets.strip.downcase        
        case input
        when 'list'
            list_articles
        when 'more info'
            article_selection
            puts ""
            menu
        when 'exit'
            goodbye
        else
            input_error
        end
    end

    def list_articles
        TopPosts::Article.list_all
        puts ""
        menu
        puts ""
    end

    def input_error
        puts ""
        puts "Sorry, please try again.".red
        puts ""
        menu
    end
    
    def article_selection
        puts ""
        puts "Which article would you like more info on? Please enter the article number."
        puts ""
        input = gets.strip.to_i - 1
        if input >= 1  && input <= 29
            TopPosts::Article.article_info(input)
        else
            input_error
        end
    end

    def self.print_article(article)
        puts ""
        puts "Title:            #{article.title}"
        puts "Author:           #{article.author}" 
        puts "Link: " + "            #{article.url}".blue
        puts "Tags:             #{article.tags}"
        puts ""

    end

    def goodbye
        puts ""
        puts "Thank you! Come back next week for more content!"
        puts ""
    end
end