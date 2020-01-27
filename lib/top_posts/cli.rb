class TopPosts::CLI
    def call
        TopPosts::API.create_articles
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
        puts "Link: " + "            #{article.url}".blue
        puts "Tags:             #{article.tags}"
        puts "Author:           #{article.author[:name]}"
        puts ""
        puts "                  DEV.to Username: #{article.author[:username]}".green
        if article.author[:github] == nil || article.author[:github]  == ""
            puts "                  GitHub: This information is not listed.".green
        else
        puts "                  GitHub: #{article.author[:github]}".green
        end
        if article.author[:website] == nil || article.author[:website]  == ""
            puts "                  Website: This information is not listed.".green
        else
        puts "                  Website: #{article.author[:website]}".green
        end
        puts ""
    end

    def goodbye
        puts ""
        puts "Thank you! Come back next week for more content!"
        exit!
    end
end