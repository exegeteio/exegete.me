# Main Application.
require 'haml'
require 'logger'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

# Log more quickly.
$stdout.sync = true

class App < Sinatra::Base
  register Sinatra::Reloader

  configure do
    $logger = Logger.new(STDOUT)
    set :haml, :format => :html5
    set :static_cache_control, [:public, max_age: 300]
  end

  get '/' do
    haml '%div.title Hello World!'
  end
end
