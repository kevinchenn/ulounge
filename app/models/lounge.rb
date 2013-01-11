class Lounge < ActiveRecord::Base
  has_many :posts
  attr_accessible :description, :name
  validates :name, :description, presence: true
end
