class Comment < ActiveRecord::Base
  belongs_to :blog, :include => :user

  attr_accessible :blog_id, :content, :user_id
end
