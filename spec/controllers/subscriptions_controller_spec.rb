require 'spec_helper'

describe SubscriptionsController do
  login_user

  describe "POST 'create'" do
    let(:feed_url) {'http://somefeed.com'}
    let(:params) {{url: feed_url}}
    let(:subscription) {FactoryGirl.build(:subscription)}

    it "retrieves the content remotely and saves the details of the subscription" do
      Subscription.should_receive(:create_from_url).with(feed_url, @user).and_return(subscription)
      post 'create', params
      response.status.should == 201
      response.headers['Location'].should == subscription_path(subscription.id)
    end
  end

end
