class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comment_likes
  attr_accessible :content, :post_id, :user_id
  validates :content, presence: true
  
  def num_likes
    - self.comment_likes.count  #negative, so order will be descending
  end
end
