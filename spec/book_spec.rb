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
      #books = {"The Last Samurai" => nil,
      #         "Ruby Cookbook" =>  nil,
      #         "Rails Recipes" =>  nil,
      #         "Agile Development with Rails" =>  nil,
      #         "Harry Potter and the Deathly Hallows" =>  nil}
      puts "\n************************************************************************\n"
      book_obj = @book
      STDOUT.should_receive(:puts).and_return("Welcome to setting book price program")
      book_obj.get_prices.should_not be_nil
      book_obj.books["The Last Samurai"].stub!(:gets) {"40"} #trying to set the value for one book using Hash
      book_obj.books["The Last Samurai"].should == 40 #verifying the value set for a particular key is accurate
    end
  end

end
