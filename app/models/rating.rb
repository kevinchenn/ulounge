class Rating < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :value
  belongs_to :user
  belongs_to :post
end
