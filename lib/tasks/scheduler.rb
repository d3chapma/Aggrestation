desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
    puts "Updating feed..."
    feeds = Feed.all
    feeds.each do |feed|
      FeedEntry.fetch_new_entries(feed.url)
      puts "#{feed.url} updated."
    end
    puts "done."
end