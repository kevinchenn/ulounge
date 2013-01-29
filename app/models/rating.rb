class Rating < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :score
  belongs_to :user
  belongs_to :post
end
