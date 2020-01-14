class TopPosts::Article
   attr_accessor :title, :id, :url, :publish_date, :tags, :tag_list
   @@all = []

   #def initialize(user, attributes)
   #   attributes.each do |attribute_name, attribute_value|
    #     self.send("#{attribute_name}=", attribute_value)
    # end
    #  @user = user
   #   @@all << self

   #end

   def initialize(args)
      
      @title = args[0]["title"]
      @id = args[0]["id"]
      @url = args[0]["url"]
      @publish_date = args[0]["published_at"]
      @tags = args[0]["tags"]
      @tag_list = args[0]["tag_list"]
   end

   def self.all
      @@all
   end

   def self.print_all
      all.each_with_index do |article, index|
         puts "#{index+1}.   #{article.title}" 
      end
   end

end