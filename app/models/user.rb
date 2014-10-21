class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :password, presence: true
  has_many :songs, through: :upvotes
  has_many :upvotes
end