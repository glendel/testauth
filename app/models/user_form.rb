class UserForm < ActiveRecord::Base
  attr_accessible :birthday, :city, :country, :fname, :gender, :lname, :state
end
