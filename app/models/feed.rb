class Feed < ActiveRecord::Base
  def update
    if etag.nil?
      new_feed = Feedzirra::Feed.fetch_and_parse(url)
      entries = new_feed.entries
    else
      last_entry = Feedzirra::Parser::AtomEntry.new
      last_entry.url = last_entry_url
      
      feed_to_update = Feedzirra::Parser::Atom.new(
        :feed_url => url,
        :etag => etag,
        :last_modified => last_modified,
        :entries => [last_entry]
      )
      
      updated_feed = Feedzirra::Feed.update(feed_to_update)
      entries = updated_feed.new_entries
    end
    
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
