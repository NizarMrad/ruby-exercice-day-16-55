  
require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
 



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
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  
  get '/gossips/:id' do
	  erb :gossip, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
	end

end






  