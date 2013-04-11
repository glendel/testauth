class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  attr_accessible :blog_id, :content, :user_id
end
