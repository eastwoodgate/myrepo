require 'bundler'

require_relative 'gossip.rb'

class Applicationcontroller < Sinatra::Base

 get '/' do
  
   erb :index , locals: {gossips: Gossip.all}

   end

 get '/gossips/new/' do

 erb :new_gossip

   end

   
 post '/gossips/new/' do

  	Gossip.new( params["gossip_content"]).save

  	redirect '/'


    end   
  

 
  get '/:id' do
  
  gossip_id = params["id"]

  gossip = Gossip.find(params["id"])

  erb :gossip_id , locals: {gossip_id: gossip_id, gossip: gossip}
  
     end

   end

