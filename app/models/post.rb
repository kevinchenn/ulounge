class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  has_many :likes
  attr_accessible :description, :lounge_id, :subject, :user_id, :photo, :created_at
  validates :subject, :description, presence: true
  has_attached_file :photo, :styles => { :medium => "400x>", :thumb => "50x50>"}
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
    
  def num_likes
    - self.likes.count  #negative, so order will be descending
  end
  
  def author
    self.user.username
  end
  
  def num_comments
    self.comments.count
  end

end
