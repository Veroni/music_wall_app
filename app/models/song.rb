class Song < ActiveRecord::Base
  validates :author, presence: true, length: { maximum: 25 }
  validates :title, presence: true, length: { maximum: 40 }
  has_many :users, through: :upvotes
  belongs_to :user
  has_many :upvotes
end