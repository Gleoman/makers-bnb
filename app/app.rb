require 'pry'

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions
  set :session_secret, '7a929c0c04b166475878f813dd25d869b5ad4e631eed3194edb2555e22039a94'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.new(password: params[:password],
                name: params[:name],
                username: params[:username])
    if user.save
      session[:user_id] = user.id
      redirect to('/users')
    else
      flash.now[:errors] = user.errors.full_messages
      erb :index
    end
  end

  get '/users' do
    @name = User.get(session[:user_id]).name
    erb :users
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name],
                description: params[:description],
                price: params[:price])
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = Space.all
    erb :'spaces/listings'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

end
