class KeywordsController < ApplicationController

  def index
    @keyword = Keyword.new
    @feed = Feed.find(params[:feed_id])
    @keywords = Keyword.find(:all)
  end
  
  def create
    @feed = Feed.find(params[:feed_id])
    @keyword = Keyword.new()
  end

end
