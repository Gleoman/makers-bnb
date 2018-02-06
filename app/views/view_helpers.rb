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
  params[:availability].split.each do |dates|
    availability = Availability.first_or_create(date: dates)
    space.availabilities << availability
  end
end
