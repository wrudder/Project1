class Reply < ApplicationRecord
  belongs_to :post, :optional => true
  belongs_to: :user, :optional => true

  validates :reply, presence: true
end
