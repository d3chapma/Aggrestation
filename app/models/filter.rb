class Filter < ActiveRecord::Base
  belongs_to :feed
  belongs_to :keyword
  
  validates_uniqueness_of :keyword_id, :scope => :feed_id
end
