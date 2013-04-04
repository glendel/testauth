class Authentication < ActiveRecord::Base
  belongs_to :user, :foreign_key => "user_id"
  attr_accessible :provider, :uid, :user_id
end
