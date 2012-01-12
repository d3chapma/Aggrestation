class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(params[:feed])

    if @feed.save
      redirect_to feeds_path, notice: 'Feed was successfully created.' 
    else
      render action: "new"
    end
  end
  
  def fetch
    @feed = Feed.find(params[:id])
    FeedEntry.update_from_feed(@feed.url)
    
    redirect_to feeds_path, notice: '#{@feed.url} fetched'
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy

    redirect_to feeds_path, notice: 'Feed destroyed' 
  end
end
