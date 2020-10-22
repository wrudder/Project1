class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_and_belongs_to_many :groups
  has_many :posts
  has_many :replies
  has_many :group_posts, :through => :groups, :source => :posts
end
