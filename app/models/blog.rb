class Blog < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  attr_accessible :birddate, :comment, :name, :picture, :picture_cache, :remove_picture, :remote_picture_url
  mount_uploader :picture, PictureUploader
end
