class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  attr_accessible :description, :lounge_id, :subject, :user_id, :likes
  validates :subject, :description, presence: true
  after_initialize :init
  
  def init
    self.likes ||= 0
  end
  
  def add_like
    self.likes += 1
  end
end
