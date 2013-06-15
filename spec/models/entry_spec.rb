require 'spec_helper'

describe Subscription do
    describe "#full_text_search" do
      before(:all) do
        user = FactoryGirl.create(:user)
        @saved_subscription = Subscription.create_from_url("http://feeds.feedburner.com/PaulDixExplainsNothing", user)
        @subscription = Subscription.find_by(user: user)
      end

      it "should find documents with words on them" do
        result = Entry.full_text_search "With the help"
        result.should_not be_nil
        result['results'].size.should == 2
      end
  end
end
