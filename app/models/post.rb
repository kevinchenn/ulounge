class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  has_many :likes
  attr_accessible :description, :lounge_id, :subject, :user_id, :photo, :created_at, :rating, :day, :genre, :opinion
  attr_accessible :tracks_attributes, :electronic, :hiphop, :rock, :pop, :indie
  validates :subject, :description, presence: true
  #paperclip
  has_attached_file :photo, :styles => { :medium => "400x>", :thumb => "50x50>"}, :storage => :s3, 
  :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:id/:filename"
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  # Coachella Lounge only
  has_many :tracks, :dependent => :destroy
  accepts_nested_attributes_for :tracks, :allow_destroy => true
  #Rating
  has_many :ratings
  has_many :raters, :through => :ratings, :source => :users    
  def num_likes
    - self.likes.count  #negative, so order will be descending
  end
  
  def author
    self.user.username
  end
  
  def num_comments
    self.comments.count
  end
  
  def average_rating
      @value = 0
      self.ratings.each do |rating|
        @value = @value + rating.value
      end
      @total = self.ratings.size
      @value.to_f / @total.to_f
  end

end
