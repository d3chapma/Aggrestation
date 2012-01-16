desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
    puts "Updating feed..."
    feeds = Feed.all
    feeds.each do |feed|
      FeedEntry.update_from_feed(feed.url)
      puts "#{feed.url} updated."
    end
    puts "done."
end