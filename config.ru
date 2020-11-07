# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'active_support/cache'

require 'rack/attack'
Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
Rack::Attack.throttle('requests by ip', limit: 5, period: 2, &:ip)
use Rack::Attack

require 'rack/ssl'
use Rack::SSL if ENV['RACK_ENV'] == 'production'

require './app'
run App
