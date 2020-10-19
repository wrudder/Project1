class Post < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :group, :optional => true
  has_many :replies

  validates :title, :discription, :codesnippet, presence: true

end
