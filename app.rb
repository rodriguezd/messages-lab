require 'sinatra'
require 'json'
require "sinatra/activerecord"
require 'debugger'


set :database, "sqlite3:///ichat.db"


get '/' do
  @messages = Message.all
  erb :messages
end

get '/reset' do
   Message.delete_all()
  "Messages reset!"

end

post '/' do
  Message.create(params)
  @messages = Message.all
  erb :messages

end

class Message < ActiveRecord::Base

  # TODO: Use this class as a table in the database

end