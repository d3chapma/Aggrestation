class KeywordsController < ApplicationController

  def index
    @keyword = Keyword.new
    @feed = Feed.find(params[:feed_id])
    @keywords = @feed.keywords
  end
  
  def create
    @feed = Feed.find(params[:feed_id])
    @keyword = Keyword.find_or_create_by_name(params[:keyword][:name])
    @feed.keywords << @keyword unless @feed.keywords.all.include?(@keyword)
    
    redirect_to feed_keywords_path(@feed), notice: 'Keyword added successfully.' 
  end
  
  def destroy  
    @feed = Feed.find(params[:feed_id])
    @keyword = Keyword.find(params[:id])
    @keyword.destroy
    
    redirect_to feed_keywords_path(@feed), notice: 'Feed destroyed' 
  end

end
