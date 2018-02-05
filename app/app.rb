ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    session[:name] = params[:name]
    User.create(password: params[:password],
                name: params[:name],
                username: params[:username])
    redirect '/users'
  end

  get '/users' do
    @name = session[:name]
    erb :users
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    session[:space] = params[:space]
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = session[:space]
    erb :'spaces/listings'
  end
end
