class TopPosts::Article
   attr_accessor :title, :description, :url, :tags
   @@all = []

   #def initialize(user, attributes)
   #   attributes.each do |attribute_name, attribute_value|
    #     self.send("#{attribute_name}=", attribute_value)
    # end
    #  @user = user
   #   @@all << self

   #end

   def initialize
      
   end

   def self.all
      @@all
   end

   def self.print_all

   end

end