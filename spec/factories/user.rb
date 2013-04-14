FactoryGirl.define do
  factory :user do
    email "user@this.site"
    password "NgH1#x_z"
    password_confirmation { "NgH1#x_z" }
  end
end

FactoryGirl.define do
  factory :subscription do
    id 123
    title          "Paul Dix Explains Nothing"
    url            "http://www.pauldix.net"
    feed_url       "http://feeds.feedburner.com/PaulDixExplainsNothing"
    etag           "GunxqnEP4NeYhrqq9TyVKTuDnh0"
    last_modified  Time.now
    user FactoryGirl.build(:user)
  end
end
