class Song < ActiveRecord::Base
  validates :author, presence: true, length: { maximum: 25 }
  validates :title, presence: true, length: { maximum: 40 }
end