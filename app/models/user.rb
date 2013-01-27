class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :username, :avatar
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :comment_likes
  validates :email, :password, :password_confirmation, :name, :username, presence: true
  
  has_attached_file :avatar, :styles => { :medium => "400x>", :thumb => "70x>"}
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  def has_like? product
    likes.find_by_product_id product.id
  end
end
