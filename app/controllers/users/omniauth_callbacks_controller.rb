class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

def twitter
if user_signed_in?
    redirect_to blogs_path
    else
@user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
     
     if ( @user.persisted? )
            sign_in_and_redirect( @user, { :event => :authentication } ) 
       set_flash_message( :notice, :success, { :kind => "Twitter" } ) if ( is_navigational_format? )
     else
       session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
       redirect_to( new_user_registration_url )
     end
  end  
  end
  
def facebook
Rails.logger.debug( 'Facebook Before Find' )
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
Rails.logger.debug( 'Facebook Before Persisted' )
Rails.logger.debug( User.all.size.to_s )
    if ( @user.persisted? )
Rails.logger.debug( 'Facebook Inside Persisted' )
      sign_in_and_redirect( @user, { :event => :authentication } ) #this will throw if @user is not activated
      set_flash_message( :notice, :success, { :kind => "Facebook" } ) if ( is_navigational_format? )
    else
Rails.logger.debug( 'Facebook Else Persisted' )
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to( new_user_registration_url )
    end
  end

def google_oauth2
Rails.logger.debug( request.env["omniauth.auth"].to_s )
    @user = User.find_for_google_oauth2_oauth(request.env["omniauth.auth"], current_user)
    if ( @user.persisted? )
      sign_in_and_redirect( @user, { :event => :authentication } ) 
      set_flash_message( :notice, :success, { :kind => "Google+" } ) if ( is_navigational_format? )
    else
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to( new_user_registration_url )
    end
  end

def github
Rails.logger.debug( request.env["omniauth.auth"].to_s )
    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)
    if ( @user.persisted? )
      sign_in_and_redirect( @user, { :event => :authentication } ) 
      set_flash_message( :notice, :success, { :kind => "github" } ) if ( is_navigational_format? )
    else
      session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to( new_user_registration_url )
    end
  end

def open_id
Rails.logger.debug( request.env["omniauth.auth"].to_s )
    @user = User.find_for_open_id_oauth(request.env["omniauth.auth"], current_user)
    if ( @user.persisted? )
      sign_in_and_redirect( @user, { :event => :authentication } ) 
      set_flash_message( :notice, :success, { :kind => "OpenID" } ) if ( is_navigational_format? )
    else
      session["devise.openid_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to( new_user_registration_url )
    end
  end

def linkedin
Rails.logger.debug( request.env["omniauth.auth"].to_s )
    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)
    if ( @user.persisted? )
      sign_in_and_redirect( @user, { :event => :authentication } ) 
      set_flash_message( :notice, :success, { :kind => "Linkedin" } ) if ( is_navigational_format? )
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to( new_user_registration_url )
    end
  end

def yahoo
Rails.logger.debug( request.env["omniauth.auth"].to_s )
    @user = User.find_for_yahoo_oauth(request.env["omniauth.auth"], current_user)
    if ( @user.persisted? )
      sign_in_and_redirect( @user, { :event => :authentication } ) 
      set_flash_message( :notice, :success, { :kind => "YAHoo" } ) if ( is_navigational_format? )
    else
      session["devise.yahoo_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to( new_user_registration_url )
    end
  end

end
