def add_availability(space)
  params[:availability].split.each do |dates|
    availability = Availability.first_or_create(date: dates)
    space.availabilities << availability
  end
end

def current_user
  @current_user ||= User.get(session[:user_id])
end

def available?(space_id, date_from, date_to)
  request = (date_from..date_to).to_a
  availabilities =  Space.all(id: space_id).availabilities.map {
                      |availability| availability.date.strftime('%Y-%m-%d') }
  (availabilities & request) == request
end
