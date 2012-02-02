class Keyword < ActiveRecord::Base
  has_many :filters, :dependent => :destroy
  has_many :feeds, :through => :filters
end
