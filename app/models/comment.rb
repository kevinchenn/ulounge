class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :content, :post_id, :user_id
  validates :content, presence: true
end
