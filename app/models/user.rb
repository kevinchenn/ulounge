class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  attr_accessible :email, :name, :password, :username
end
