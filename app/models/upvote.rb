class Upvote < ActiveRecord::Base
  # before_create :one_like_per_song_per_user
  validates :user_id, uniqueness: {scope: [:song_id]}
   # validates_uniqueness_of :user_id, :scope => :song_id

  belongs_to :user
  belongs_to :song

  # protected 
  # def one_like_per_song_per_user
  #   if Upvote[user_id: @current_user, song_id: @song.id].exists?
  #     errors.add("You already liked this song") 
  #   end
  # end
end