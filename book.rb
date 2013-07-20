class Book
	
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
        puts "Price can't be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer"
        price = STDIN.gets.chomp #gets.chomp - throws error
      end
      price == "second hand" ? price = "100" : price #takes a default price
      hash[book.first] = price.to_i
      hash
    }
  end

end

books = {"The Last Samurai" => nil,
         "Ruby Cookbook" =>  nil,
         "Rails Recipes" =>  nil,
         "Agile Development with Rails" =>  nil,
         "Harry Potter and the Deathly Hallows" =>  nil}


book_details = Book.new(books)
book_details.get_prices
puts "\n*******Books Details:#{book_details.books}******\n"
