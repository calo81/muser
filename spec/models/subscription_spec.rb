require 'spec_helper'

describe Subscription do
  describe "#create_from_url should retrieve from URL and save on mongo" do

    before(:all) do
      user = FactoryGirl.create(:user)
      @saved_subscription = Subscription.create_from_url("http://feeds.feedburner.com/PaulDixExplainsNothing", user)
      @subscription = Subscription.find_by(user: user)
    end

    it "should set title" do
      @subscription.should_not be_nil
      @subscription.title.should == 'Paul Dix Explains Nothing'
      @subscription.should == @saved_subscription
    end
  end

  describe "#create_from_url return nil for wrong requests" do
    before(:all) do
      user = FactoryGirl.create(:user)
      @saved_subscription = Subscription.create_from_url("http://feeds.feedburner.com/PaulDixExjjnjing", user)
      @subscription = Subscription.find_by(user: user)
    end

    it "should be nil" do
      @subscription.should be_nil
      @saved_subscription.should be_nil
    end
  end
end
