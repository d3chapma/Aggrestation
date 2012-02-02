class Feed < ActiveRecord::Base
  has_many :filters, :dependent => :destroy
  has_many :keywords, :through => :filters, :uniq => true
  
  def update
    if etag.nil?
      new_feed = Feedzirra::Feed.fetch_and_parse(url)
      entries = new_feed.entries
    else
      last_entry = Feedzirra::Parser::AtomEntry.new
      last_entry.url = last_entry_url
      
      feed_to_update = Feedzirra::Parser::Atom.new
      feed_to_update.feed_url = url
      feed_to_update.etag = etag
      feed_to_update.last_modified = last_modified
      feed_to_update.entries = [last_entry]
      
      updated_feed = Feedzirra::Feed.update(feed_to_update)
      puts updated_feed.inspect
      entries = []
    end
    
    the_feed = updated_feed || new_feed
    self.etag = the_feed.etag
    self.last_modified = the_feed.last_modified
    self.last_entry_url = entries.last ? entries.last.url : last_entry_url
    self.save
    
    entries.each do |entry|
      content = entry.content ? entry.content.sanitize : nil
      FeedEntry.create!(
        :name => entry.title.sanitize,
        :summary => entry.summary.sanitize,
        :content => content,
        :url => entry.url,
        :published_at => entry.published,
        :guid => entry.id
      )
    end     
  end
end
