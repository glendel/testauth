class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  attr_accessible :content, :user_id
  
  #=======================================
  #  self.search
  #=======================================
  def self.search(search)
      Rails.logger.debug( 'hello from search comments' )
      unless (search.nil? || search.empty?)
    Rails.logger.debug( 'search != nil and empty in comments' )
        return (where('`content` LIKE ?', "%#{search}%"))

      else
          Rails.logger.debug( 'search nill in comments' )
        return (scoped)

      end
  rescue Exception => error
   return (Blog.all)
  end

end
