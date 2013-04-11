class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :birddate, :comment, :name, :picture, :picture_cache, :remove_picture, :remote_picture_url
  mount_uploader :picture, PictureUploader
end
