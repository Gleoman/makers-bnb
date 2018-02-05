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
end
