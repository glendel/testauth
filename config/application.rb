require File.expand_path('../boot', __FILE__)
#OpenSS::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'rails/all'
# keys facebook
ENV['FACEBOOK_KEY'] = '572459022778488'
ENV['FACEBOOK_SECRET'] = 'e43623b546ab3839623d0a7df7750c8e'
# keys twitter
ENV['CONSUMER_KEY'] = 'B32W1pq99z1PeGNlOxFFnA'
ENV['CONSUMER_SECRET'] = 'wfs6audIUZzGaBvdgF8vPH2b8d1d1fCkVFbx21yAQ'
# keys google+
ENV["GOOGLE_KEY"] = '31317523743-dkshvv3k1urtkqnqqiddfikme2je4uc4.apps.googleusercontent.com'
ENV["GOOGLE_SECRET"] = 'w1AQ55wMuoj6YocgihCe28db'
# github
ENV["GITHUB_KEY"] = 'a4c74a17f1974dc3cbd6'
ENV["GITHUB_SECRET"] = 'f7c068bd0c00c120b585b26225dee7b023f57e97'
# linkedin
ENV["LINKEDIN_KEY"] = '5qjwan8a8k7m'
ENV["LINKEDIN_SECRET"] = 'S4SI2JZZFcN2kc7X'
# yahoo
ENV["YAHOO_KEY"] = 'dj0yJmk9amNTS1gxSUI0VnRrJmQ9WVdrOU0xcGhUWFJLTldrbWNHbzlNVE14TkRVeU9EYzJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD03OA--'
ENV["YAHOO_SECRET"] = '04caa20991245ab4a29c92da4ba86fb79ad15a7d'


if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Testauth
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end
