class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessor
  attr_accessor :loginV
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :loginV
  # attr_accessible :title, :body
  validates :login, :uniqueness => {:message => "is already in use"}, :presence => {:message => "can't be empty"}
 #=============================================================
 # self.find_first_by_auth_conditions
 #=============================================================

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
     if login = conditions.delete(:loginV)
        return( where(conditions).where(["lower(login) = :value or lower(email) = :value", { :value => login.downcase }]).first )
     else
      return( where(conditions).first )
     end
end

end
