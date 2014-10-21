class Upvote < ActiveRecord::Base
  # before_create :one_like_per_song_per_user

  belongs_to :user
  belongs_to :song

  # protected 
  # def :one_like_per_song_per_user
  #   if Upvote(user_id, song_id).exists?
  #     errors.add("You already liked this song")
  # end
end