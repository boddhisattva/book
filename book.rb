class Book
  def initialize books
    @books = books
  end

  def get_prices
    puts "Please enter appropriate price for each book item:-"
    count = 0
    @books = @books.inject({}) { |hash, book|
      print "#{book.first}: "
      price = gets.chomp
      #while ((duration.to_i <= 0  || duration.include?(".") || /^[-+]?[0-9]+$/.match(duration).nil?) && duration != "lightning")
      while (price !~ /^[1-9]\d*$/ && price != "second hand")
        puts "Price can't be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer"
        price = gets.chomp
      end
      price == "second hand" ? price = "100" : price #takes a default price
      hash[book.first] = price.to_i
      hash
    }
  end

  #def get_duration
  #  puts "Welcome to Conference Talks Scheduler Program, to start with, may I request you to enter the duration for each talk in minutes:-"
  #  @talks = @talks.inject({}) { |hash, talk|
  #    print "#{talk.first}: "
  #    duration = gets.chomp
  #    #while ((duration.to_i <= 0  || duration.include?(".") || /^[-+]?[0-9]+$/.match(duration).nil?) && duration != "lightning")
  #    while (duration !~ /^[1-9]\d*$/ && duration != "lightning")
  #      puts "Duration of a talk can't be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer minutes for #{talk.first} talk:"
  #      duration = gets.chomp
  #    end
  #    duration == "lightning" ? duration = "5" : duration
  #    hash[talk.first] = duration.to_i
  #    hash
  #  }
  #end

end

books = {"The Last Samurai" => nil,
         "Ruby Cookbook" =>  nil,
         "Rails Recipes" =>  nil,
         "Agile Development with Rails" =>  nil,
         "Harry Potter and the Deathly Hallows" =>  nil}


book_details = Book.new(books)
book_details.get_prices

#books = 10
#puts "enter title"
#title = gets.chomp
#puts "enter
#
#Book.new
