require File.expand_path('../boot', __FILE__)

# require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KeepSyncAPI
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # config.available_locales = %i(fr)
    # config.i18n.default_locale = :fr
    # config.i18n.fallbacks = [:fr]

    config.generators do |gen|
      gen.template_engenine :slim
      gen.test_framework :rspec, fixtures: true
      gen.fixtures_replacement :factory_genirl, dir: 'spec/factories'
      gen.helper false
      gen.view_specs false
      gen.assets false
      gen.decorators false
    end

    # # Bower asset paths
    # root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
    #   config.sass.load_paths << bower_path
    #   config.assets.paths << bower_path
    # end
    # # Precompile Bootstrap fonts
    # config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
    # config.assets.precompile << Proc.new { |path| path =~ /font-awesome\/fonts/ and File.extname(path).in?(['.otf', '.eot', '.svg', '.ttf', '.woff']) }

    # # Minimum Sass number precision required by bootstrap-sass
    # ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max
  end
end
