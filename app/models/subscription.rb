require 'feedzirra'
class Subscription
  include Mongoid::Document

  belongs_to :user

  field :title
  field :url
  field :feed_url
  field :etag
  field :last_modified
  field :entries


  def self.create_from_url(url, user)
    feed = Feedzirra::Feed.fetch_and_parse(url)
    subscription = self.new(JSON.parse(feed.to_json))
    subscription.user = user
    subscription.save
    subscription
  end

end