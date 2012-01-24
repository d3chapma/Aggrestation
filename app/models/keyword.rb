class Keyword < ActiveRecord::Base
  has_many :filters
  has_many :feeds, :through => :filters
end
