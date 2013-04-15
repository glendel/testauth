class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  attr_accessible :content, :user_id
end
