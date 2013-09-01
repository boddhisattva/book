class RspecLoopStop < Exception; end
#require './publisher' requires your module to be in the same directory as current...
# #reference http://stackoverflow.com/questions/9750610/ruby-require-error-cannot-load-such-file
require_relative 'publisher'

module Week
  FIRST_DAY = "Sunday"
  def Week.weeks_in_month
    puts "You have four weeks in a month"
  end
  def Week.weeks_in_year
    puts "You have 52 weeks in a year"
  end
end

class Book
  include Week
  include Publisher# even without the include stmnt Publisher.get_publisher works..
  attr_accessor :books
  def initialize books
    puts "Welcome to setting book price program"
    @books = books
  end

  def get_prices
    puts "Please enter appropriate price for each book item:-"
    count = 0
    @books = @books.inject({}) { |hash, book|
      print "#{book.first}: "
      price = STDIN.gets.chomp
      while (price !~ /^[1-9]\d*$/ && price != "second hand")
        puts "Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer"
        price = STDIN.gets.chomp #gets.chomp - throws error
      end
      price == "second hand" ? price = "100" : price #takes a default price
      hash[book.first] = price.to_i
      hash
    }
  end

  def self.categories #return say all the categories
    puts "\n I'm in the categories class method" #class methods are recognized by self
  end

  def Book.publishers #return say all the publishers
    puts "\n I'm in a class method" #class methods are recognized by Class name, please remember even a class is an object in Ruby
  end # The class Book itself is an instance of type Class

  def get_publisher #returns for a specific object/instance of type Book
    puts "I'm in the get publisher instance method"
  end

end

books = {"The Last Samurai" => nil,
         "Ruby Cookbook" =>  nil,
         "Rails Recipes" =>  nil,
         "Agile Development with Rails" =>  nil,
         "Harry Potter and the Deathly Hallows" =>  nil}


book_details = Book.new(books)
book_details.get_prices
Book.categories
Book.publishers
#book_details.publisher_name

#def book_details.Book.get_category currently throws error , please check correct syntax..
#puts "I'm in the get category instance method" # to check - http://www.rubyfleebie.com/understanding-class-methods-in-ruby/comment-page-1/#comment-2045
#end
book_details.get_publisher
#book_details.categories #throws undefined method `categories' for #<Book:0x00000001eac828> (NoMethodError)
#Book.get_publisher #throws error undefined method `get_publisher' for Book:Class (NoMethodError)
Book.new(books).get_publisher #will work

Publisher.publisher_name
Week.weeks_in_year
#book_details.publisher_name --> please check.. come back 2..
