require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
 

  run! if app_file == $0

  #get '/' do
    #erb :index
  #end

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossips
  end

  post '/gossips/new/' do
    puts Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
end






  