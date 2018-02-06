require 'pry'
require './app/views/view_helpers'

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.new(password: params[:password],
                name: params[:name],
                username: params[:username])
    valid_user(user)
  end

  get '/users' do
    @name = User.get(session[:user_id]).name
    erb :users
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.new(name: params[:name],
                description: params[:description],
                price: params[:price])
    add_availability(space)
    space.save
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = Space.all
    erb :'spaces/listings'
  end
end
