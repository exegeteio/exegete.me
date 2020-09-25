# Main Application.
require 'haml'
require 'logger'
require 'rdiscount'
require 'sinatra'
require 'sinatra/base'
require "sinatra/content_for"
require 'sinatra/reloader'

# Log more quickly.
$stdout.sync = true

class App < Sinatra::Base
  register Sinatra::Reloader
  helpers Sinatra::ContentFor

  configure do
    $logger = Logger.new(STDOUT)
    set :haml, :format => :html5
    set :markdown, :layout_engine => :haml
    set :static_cache_control, [:public, max_age: 300]
  end

  get '/' do
    haml :index
  end
  
  get '/:path' do |path|
    begin
      haml params[:path].to_sym
    rescue Errno::ENOENT
      pass
    end
  end
  
  get '/blog/:path' do |path|
    begin
      haml params[:path].to_sym, layout: 'blog.haml'
    rescue Errno::ENOENT
      pass
    end
  end
end
