class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validate :email, :valid_email

  has_many :songs, through: :upvotes
  has_many :upvotes

  def valid_email
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "is not an email")
    end
  end
end