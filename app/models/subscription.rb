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
  field :id


  def self.create_from_url(url, user)
    feed = Feedzirra::Feed.fetch_and_parse(url)
    return if feed.nil? or (feed.respond_to?(:is_empty?) and feed.is_empty?) or feed == 0
    subscription = self.new(JSON.parse(feed.to_json))
    subscription.user = user
    subscription.save
    subscription
  end

  def reload
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed_json = JSON.parse(feed.to_json)
    incoming_titles = feed_json['entries'].map{|entry| entry['title']}
    self.entries = feed_json['entries'] + self.entries.delete_if{|entry| incoming_titles.include?(entry['title'])}
    self.save
  end

end