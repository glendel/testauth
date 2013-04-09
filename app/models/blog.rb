class Blog < ActiveRecord::Base
  attr_accessible :birddate, :comment, :name, :picture
  mount_uploader :picture, PictureUploader
end
