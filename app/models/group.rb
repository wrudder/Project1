class Group < ApplicationRecord
  has_many :users, through: :posts
  has_many :posts
end
