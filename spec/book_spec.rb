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

end
