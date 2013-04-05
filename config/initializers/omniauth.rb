Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :strategy_class => OmniAuth::Strategies::Facebook 
  provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"], {:scope => "userinfo.email,userinfo.profile,plus.me",:approval_prompt => "auto" }
end
