def add_availability(space)
  params[:availability].split.each do |dates|
    availability = Availability.first_or_create(date: dates)
    space.availabilities << availability
  end
end

def current_user
  @current_user ||= User.get(session[:user_id])
end
