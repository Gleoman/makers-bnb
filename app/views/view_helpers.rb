def valid_user(user)
  if user.save
    session[:user_id] = user.id
    redirect to('/users')
  else
    session[:error] = true
    redirect to('/')
  end
end

def add_availability(space)
  availability = Availability.first_or_create(date: params[:availability])
  space.availabilities << availability
end
