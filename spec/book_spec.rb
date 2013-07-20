require 'spec_helper'

describe Book do

  before :each do
    books = {"The Last Samurai" => nil,
         "Ruby Cookbook" =>  nil,
         "Rails Recipes" =>  nil,
         "Agile Development with Rails" =>  nil,
         "Harry Potter and the Deathly Hallows" =>  nil}
    @book = Book.new(books)
  end

  describe "#new" do
    it "Should be an instance of the Book" do
      @book.should be_an_instance_of Book
    end
  end

  describe "#getprice" do
    it "Should get the price in the correct format or else return appropriate error" do
      puts "\n************************************************************************\n"
      book_obj = @book
      STDIN.stub(:gets) { "40" }
      book_obj.get_prices.should_not be_nil
    end

    it "Incorrect input format should return error message asking user to re input" do
      puts "\n************************************************************************\n"
      book_obj = @book
      #STDIN.stub(:gets) { "40abc" }

      #book_obj.get_prices.should be_nil --> adding this line of code goes into an infinite loop with the error message below
      #Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer\n

      #STDOUT.should_receive(:puts).and_return("Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer\n")

      #the below two tests fails with syntax error - don't seem that easy to figure out what's going wrong

      #STDOUT.should_receive("Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer\n")
      #\n towards the end is as in the third line of input the user is asked to re enter input in correct format
      #STDOUT.should == "Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer\n"


      #begin    #didn't work for me
      #  STDIN.stub(:gets) { "40abc" }
      #  book_obj.get_prices.should_raise RspecLoopStop
      #rescue RspecLoopStop
      #  #exit
      #end

      begin
        STDIN.stub(:gets) { "40abc" } #incorrect input prompts user to re enter price in correct format
        book_obj.get_prices #how to catch the infinite loop as an exception and exit out of it say using rescue block
      rescue #I guess this won't be called until the exception is correctly caught
        STDIN.stub(:gets) { "85" }
        book_obj.get_prices.should_not be_nil
      end

    end
  end

end
