class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  has_many :likes
  attr_accessible :description, :lounge_id, :subject, :user_id, :photo
  validates :subject, :description, presence: true
  has_attached_file :photo, :styles => { :medium => "300x>", :thumb => "70x>"}
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
    
  def num_likes
    - self.likes.count
  end

end
