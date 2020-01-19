 class TopPosts::Author
    attr_accessor :name, :username, :website
    @@all =[]

     def initialize(author)
         author.each do |key, value|
          if value == nil || value == ""
              value = "Information not found."
          end
            self.send("#{key}=", value)
        end
         @@all << self
     end

     def self.all
        @@all
        binding.pry
     end
 end