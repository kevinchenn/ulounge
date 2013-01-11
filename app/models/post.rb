class Post < ActiveRecord::Base
  belongs_to :lounge
  belongs_to :user
  has_many :comments
  attr_accessible :description, :lounge_id, :subject, :user_id
end
