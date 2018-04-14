require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
#require 'sidekiq'
require 'sucker_punch'
require 'net/http'
require 'uri'

require_relative '../lib/words_counter'
require_relative '../app/handlers/word_counting_handler'

Bundler.require(*Rails.groups)

module WordCount
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
  end
end
