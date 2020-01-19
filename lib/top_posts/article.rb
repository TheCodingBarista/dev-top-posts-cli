class TopPosts::Article
  attr_accessor :title, :description, :url, :tags, :author
  @@all = []

  def initialize(article)
    article.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
    binding.pry
  end

  def self.list_all
    self.all.each.with_index(1) do |article, index|
       puts "#{index}. #{article.title}"
    end
  end 

  def self.top_five
    self.all.each.with_index(1) do |article, index|
       if index < 6
       puts "#{index}. #{article.title}"
       puts ""
       end
    end
  end

  def self.find_article_number(number)
    self.all[number-1]
  end
end