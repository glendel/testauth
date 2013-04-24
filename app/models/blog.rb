class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  attr_accessible :birddate, :content, :name, :picture, :picture_cache, :remove_picture, :remote_picture_url
  mount_uploader :picture, PictureUploader

  #=======================================
  #  self.search
  #=======================================
  def self.search(search)
      unless (search.nil? || search.empty?)
        return (Blog.where('`name` LIKE ? OR `content` LIKE ?', "%#{search}%", "%#{search}%"))
      else
        return (Blog.scoped)
      end
  rescue Exception => error
   return (Blog.all)
  end

end

