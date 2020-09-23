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
    static_loc = File.dirname(__FILE__) + '/public'
    set :haml, :format => :html5
    set :static_cache_control, [:public, max_age: 300]
    set :public_folder, static_loc
    $logger.info("Serving static files from: #{static_loc}:  #{File.exist?(static_loc + "/style.css")}")
  end

  get '/' do
    haml '%div.title Hello World!'
  end
end
