require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'torquebox-stomp'
require 'tweetwatch'

class TweetWatch < Sinatra::Base
  use TorqueBox::Stomp::StompJavascriptClientProvider
  
  set :views, lambda { File.join( File.dirname( __FILE__ ), "views" ) }

  
  get '/' do
    haml :index
  end

end
