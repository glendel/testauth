require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :strategy_class => OmniAuth::Strategies::Facebook 
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {:scope => "userinfo.email,userinfo.profile,plus.me",:approval_prompt => "auto" }
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"]
  provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp')
  provider :linkedin, ENV["LINKEDIN_KEY"], ENV["LINKEDIN_SECRET"]
  provider :yahoo, ENV["YAHOO_KEY"], ENV["YAHOO_SECRET"]  
end
