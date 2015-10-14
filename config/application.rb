require File.expand_path('../boot', __FILE__)

# require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module KeepSyncAPI
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |gen|
      gen.template_engenine :slim
      gen.test_framework :rspec, fixtures: true
      gen.fixtures_replacement :factory_genirl, dir: 'spec/factories'
      gen.helper false
      gen.view_specs false
      gen.assets false
      gen.decorators false
    end
  end
end
