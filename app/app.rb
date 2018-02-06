ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(password: params[:password],
                name: params[:name],
                username: params[:username])
    session[:user_id] = user.id
    redirect '/users'
  end

  get '/users' do
    @name = User.get(session[:user_id]).name
    erb :users
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = Space.all
    erb :'spaces/listings'
  end
end
