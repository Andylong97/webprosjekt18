# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'geoutm'
require 'polylines'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webprosjekt18
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :nb
    config.assets.precompile += %w[*.ttf *.woff *.svg *.eot]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
