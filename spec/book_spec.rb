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
      puts "\n*******************************Proper input*****************************************\n"
      book_obj = @book
      STDIN.stub(:gets) { "40" }
      book_obj.get_prices.should_not be_nil
    end

    it "Incorrect input format should return error message asking user to re input" do
      puts "\n*******************************Incorrect input - alphanumeric data*****************************************\n"
      book_obj = @book
      STDIN.stub(:gets) { "40abc" }
      STDIN.stub(:gets) { "40" }
      book_obj.get_prices
      STDOUT.should_receive(:puts).with("Price cannot be 0 or a negative integer or in decimal format or alphanumeric. \nPlease input appropriate duration in integer\n")
    end
  end

end
