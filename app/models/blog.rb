class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  attr_accessible :birddate, :content, :name, :picture, :picture_cache, :remove_picture, :remote_picture_url
  mount_uploader :picture, PictureUploader

  #=======================================
  #  self.search
  #=======================================
  def self.search(search)
      Rails.logger.debug( 'hello from search blogs' )
      unless (search.nil? || search.empty?)
	  Rails.logger.debug( 'search != nil and empty' )
        return (Blog.where('`name` LIKE ? OR `content` LIKE ?', "%#{search}%", "%#{search}%"))

      else
          Rails.logger.debug( 'search nill' )
        return (Blog.scoped)

      end
  rescue Exception => error
   return (Blog.all)
  end

end

