class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:facebook, :twitter]
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
  #=============================================================
  # self.find_for_twitter_oauth
  #=============================================================

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    authV = Authentication.where( { :provider => auth.provider, :uid => auth.uid } ).first
    if ( authV )
       return( authV.user )
    else 
       user = User.create({    login:auth.info.nickname,
                               email:auth.info.nickname+'@change.me',
                               password:Devise.friendly_token[0,20]
                         })

       user.authentications.create ( { provider:auth.provider, uid:auth.uid })

       return( user )
    end
  end
 
  
  #=============================================================
  # self.find_for_facebook_oauth
  #=============================================================
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    # 1. Buscar en la tabla "authentications".
    # 1.1. Si existe buscar el usuario relacionado y retornar ese usuario.
    # 1.2. Si no existe, crear el usuario con los datos suministrados por el proveedor incluyendo la authentication.
   #=============================================================
   # create_login_facebook
   #============================================================= 
   email = auth.info.email.split(/@/)
    login_taken = User.where( :login => email[0]).first
        unless login_taken
            login = email[0]
        else	
            login = auth.info.email
        end	       
   #============================================================= 
   authV = Authentication.where( { :provider => auth.provider, :uid => auth.uid } ).first
   if ( authV )
       return( authV.user )
   else 
      user = User.create( { login:login,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20]
                         })
      user.authentications.create ( { provider:auth.provider, uid:auth.uid } )
    return( user )
    end
  end


end
