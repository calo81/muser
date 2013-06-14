require 'feedzirra'
require 'opml_saw'
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
    subscription['entries'].each{|entry| entry["viewed"] = false}
    subscription.user = user
    subscription.save
    subscription
  end

  def self.create_from_opml(opml_xml, user)
    opml = OpmlSaw::Parser.new(opml_xml)
    opml.parse
    opml.feeds.each do |feed|
      self.create_from_url(feed[:xml_url],user)
    end
  end

  def reload
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed_json = JSON.parse(feed.to_json)
    existing_titles = self.entries.map{|entry| entry['title']}
    feed_json['entries'].each{|entry| entry["viewed"] = false}
    self.entries = feed_json['entries'].delete_if{|entry| existing_titles.include?(entry['title'])} + self.entries
    self.save
  end



end