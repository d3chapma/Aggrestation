desc "This task is called by the Heroku scheduler add-on"
task :update_feeds => :environment do
    puts "Updating feed..."
    feeds = Feed.all
    feeds.each do |feed|
      feed.update
      puts "#{feed.url} updated."
    end
    puts "done."
end