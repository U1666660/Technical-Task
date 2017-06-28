require_relative 'boot'

require 'rails/all'
<<<<<<< HEAD
require 'csv'
require 'utf8-cleaner'
=======
>>>>>>> fd31c8cfa51fdee45960d86fa085cefc2ebef888

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

<<<<<<< HEAD
module Task
=======
module Nhstask
>>>>>>> fd31c8cfa51fdee45960d86fa085cefc2ebef888
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
