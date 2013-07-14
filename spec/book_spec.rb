require 'spec_helper'

describe Book do

  before :each do
    talks = {"Writing Fast Tests Against Enterprise Rails" => nil,
             "Overdoing it in Python" =>  nil,
             "Lua for the Masses" =>  nil,
             "Ruby Errors from Mismatched Gem Versions" =>  nil,
             "Common Ruby Errors" =>  nil,
             "Rails for Python Developers" =>  nil,
             "Communicating Over Distance" =>  nil,
             "Accounting-Driven Development" =>  nil,
             "Woah" =>  nil,
             "Sit Down and Write" =>  nil,
             "Pair Programming vs Noise" =>  nil,
             "Rails Magic" =>  nil,
             "Ruby on Rails: Why We Should Move On" =>  nil,
             "Clojure Ate Scala (on my project)" =>  nil}
    sessions = Hash[:morning => 180, :afternoon =>240]
    @conf_scheduler_test = Book.new(talks,sessions,:entry_new)
  end

  describe "#new" do
    it "Should be an instance of the TalksScheduler" do
      @conf_scheduler_test.should be_an_instance_of Book
    end
  end

end
