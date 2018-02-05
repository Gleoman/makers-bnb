require 'sinatra/base'

class DwellBNB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    session[:name] = params[:name]
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
