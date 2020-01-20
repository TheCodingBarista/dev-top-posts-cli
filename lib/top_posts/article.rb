class TopPosts::Article
  attr_accessor :title, :description, :url, :tags, :author
  @@all = []

  def initialize(article)
    article.each do |key, value|
      if value == nil || value == ""
        value = "Information not found."
      end
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    puts ""
    self.top_five
    puts "More Posts".green
    puts ""
    self.all.each.with_index(1) do |article, index|
      if index > 5
        puts "#{index}. #{article.title}"
      end
    end
  end 

  def self.top_five
    puts "Top 5 Most Popular Posts".red
    puts ""
    self.all.each.with_index(1) do |article, index|
       if index < 6
       puts "#{index}. #{article.title}".blue
       puts ""
       end
    end
  end

  def self.article_info(input)
    article = self.all[input]
    TopPosts::CLI.print_article(article)
  end
end