class FeedEntry < ActiveRecord::Base
  def self.update_from_feed(feed_url)
    feed = Feedzirra::Feed.fetch_and_parse(feed_url)
    feed.entries.each do |entry|
      unless exists? :guid => entry.id
        content = entry.content.nil? ? nil : entry.content.sanitize
        create!(
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
end