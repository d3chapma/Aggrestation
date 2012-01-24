class Filter < ActiveRecord::Base
  belongs_to :feed
  belongs_to :keyword
end
