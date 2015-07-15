require File.expand_path('../boot', __FILE__)

require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Adaptoid
  class Application < Rails::Application
    config.generators do |g|
      g.helper false
      g.stylesheets false
      g.javascripts false
    end
  end
end
