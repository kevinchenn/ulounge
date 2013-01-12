class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  attr_accessible :description, :lounge_id, :subject, :user_id, :likes, :photo
  validates :subject, :description, presence: true
  has_attached_file :photo, :styles => { :medium => "300x>", :thumb => "70x>"}
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  after_initialize :init
  
  default_scope :order => "likes DESC"
  
  def init
    self.likes ||= 0
  end
end
