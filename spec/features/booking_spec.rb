feature 'a user can book a space' do

  scenario 'A can choose a space they want to book' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Date from'
    expect(page).to have_content 'Date to'
  end

  scenario 'User cant book a space without signing in' do
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    expect(page).to have_content("You can't book without signing in")
  end


  scenario 'A user can request to book a space' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2018-02-13"
    fill_in 'date to', with: "2018-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    expect(page).to have_content 'Booking @ Ed\'s space requested for 13/02/2018 - 14/02/2018'
    expect(current_path).to eq '/bookings/request_confirmation'
  end

  scenario 'A user can\'t request a booking that is not available' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2018-02-17"
    fill_in 'date to', with: "2018-02-18"
    click_button 'Request to book'
    expect(page).to have_content 'Space is not available on those dates'
  end

  scenario 'A user can\'t request the same booking twice' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2018-02-13"
    fill_in 'date to', with: "2018-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2018-02-13"
    fill_in 'date to', with: "2018-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(0)
  end

  # scenario 'it removes the date booked when the owner confirms the booking' do
  #   pending
  #   sign_up
  #   list_space_with_date
  #   click_button('Sign out')
  #
  #   sign_up_as_customer
  #   visit '/spaces'
  #   click_button 'Book Ed\'s space'
  #   expect(current_path).to eq '/bookings/new'
  #   fill_in 'date from', with: "2018-02-13"
  #   fill_in 'date to', with: "2018-02-14"
  #   expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
  #   click_button('Sign out')
  #
  #   log_in(username: 'ed01', password: 'password1')
  #   visit '/booking/confirmation'
  #   click_button('Confirm')
  #
  #   expect(AvailabilitySpace.count).to eq 1
  # end
end

feature 'search for a space' do
	scenario 'a user can search by available dates' do
		list_space_with_date
		visit '/spaces/new'
		fill_in 'name', with: 'Alex\'s space'
		fill_in 'description', with: 'reasonable'
		fill_in 'price', with: '£55'
		fill_in 'availability', with: '18/05/2018, 20/12/2018, 01/01/2019'
		fill_in 'picture_url', with: 'https://i.imgur.com/NAymlu5.jpg, https://i.imgur.com/PgVpNx4.jpg?1'
		click_button 'List space'
		expect(page).to have_field("check_availability")
		fill_in 'check_availability', with: '18/05/2018'
		click_button 'Search'
		expect(page).to have_content 'Alex\'s space'
		expect(page).to_not have_content 'Ed\'s space'
	end
end
