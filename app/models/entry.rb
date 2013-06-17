class Entry
  include Mongoid::Document

  belongs_to :subscription

  field :id
  field :title
  field :summary
  field :viewed
  field :published

  index(
      { "summary" => 'text', "title" => 'text'}
  )

  def self.full_text_search(text)
    self.mongo_session.command(text: 'entries', search: text)
  end

end