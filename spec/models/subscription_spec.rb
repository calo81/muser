require 'spec_helper'

describe Subscription do
  describe "#create_from_url should retrieve from URL and save on mongo" do

    before(:all) do
      user = FactoryGirl.create(:user)
      Subscription.create_from_url("http://feeds.feedburner.com/PaulDixExplainsNothing", user)
      @subscription = Subscription.find_by(user: user)
    end
    it "should set title" do
      @subscription.should_not be_nil
      @subscription.title.should == 'Paul Dix Explains Nothing'
    end
  end
end
