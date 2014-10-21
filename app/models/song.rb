class Song < ActiveRecord::Base
  validates :author, presence: true
  validates :title, presence: true
  has_many :users, through: :upvotes
  belongs_to :user
  has_many :upvotes
end

# for future update:
# add actual video to the page
# under video, share, embed, grab the link
# <iframe width="560" height="315" src="//www.youtube.com/embed/Ckom3gf57Yw?list=RDCkom3gf57Yw" frameborder="0" allowfullscreen></iframe>