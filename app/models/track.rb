class Track < ActiveRecord::Base
  attr_accessible :post_id, :url, :name
  belongs_to :post
end
