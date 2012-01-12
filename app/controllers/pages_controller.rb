class PagesController < ApplicationController
  def index
    @entries = FeedEntry.all(:order => "published_at desc")
  end
end
