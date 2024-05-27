require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module GrapeApi
  class Application < Rails::Application
    config.load_defaults 7.1
    users_file = Rails.root.join('app', 'api', 'v1', 'users.rb')
    require users_file if File.exist?(users_file)
    # Add the autoload path for the v1 directory within app/api
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    # Other configurations...
  end
end
