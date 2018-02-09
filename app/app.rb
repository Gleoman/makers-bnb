require 'pry'
require './app/views/view_helpers'

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './database_setup.rb'

class DwellBNB < Sinatra::Base

  enable :sessions
  set :session_secret, '7a929c0c04b166475878f813dd25d869b5ad4e631eed3194edb2555e22039a94'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @listings = Space.all
    erb :'spaces/listings'
  end

  post '/users' do
    user = User.new(password: params[:password],
                name: params[:name],
                username: params[:username])
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = user.errors.full_messages
			@listings = Space.all
      erb :'users/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    space = Space.new(name: params[:name],
                description: params[:description],
                price: params[:price], picture_url: params[:picture_url])
    add_availability(space)
    space.save
    redirect '/spaces'
  end

  get '/spaces' do
    @listings = Space.all
    erb :'spaces/listings'
  end

	post '/spaces/availability' do
		@listings = []
		params[:check_availability].split.each do |date|
			formatted_date = Date.strptime(date, '%d/%m/%Y')
			@listings << Space.all.availabilities(date: formatted_date).spaces.pop
	  end
		erb :'spaces/listings'
	end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  get '/sessions/sign_out' do
    @listings = Space.all
    erb :'sessions/sign_out'
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

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Thanks for stopping by !'
    redirect to '/'
  end

  delete '/availability' do
    Space.remove_availability(params[:space_id], params[:availability_id])
    redirect to '/spaces'
  end

  get '/bookings/new' do
    @space = Space.get(session[:space_id])
    erb :'bookings/new'
  end

  post '/bookings/new' do
    session[:space_id] =  params[:space_id]
    redirect '/bookings/new'
  end

  post '/bookings' do
    if available?(session[:space_id], params[:'date from'], params[:'date to'])
      booking = Booking.first_or_create(date_to: params[:'date to'], date_from: params[:'date from'],
                            user_id: session[:user_id], space_id: session[:space_id]
                           )
      session[:booking_id] = booking.id
      redirect '/bookings/request_confirmation'
    else
      flash.next[:notice] = 'Space is not available on those dates'
      redirect '/bookings/new'
    end
  end

  get '/bookings/request_confirmation' do
    @booking = Booking.get(session[:booking_id])
    @space = Space.get(@booking.space_id)
    erb :'bookings/request_confirmation'
  end

end
