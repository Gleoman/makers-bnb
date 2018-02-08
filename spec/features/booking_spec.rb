feature 'a user can book a space' do

  scenario 'A can choose a space they want to book' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Book Space'
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
    fill_in 'date from', with: "2017-02-13"
    fill_in 'date to', with: "2017-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    expect(page).to have_content 'Booking @ Ed\'s space requested for 13/02/2017 - 14/02/2017'
    expect(current_path).to eq '/bookings/request_confirmation'
  end

  scenario 'A user can\'t request a booking that is not available' do

  end

  scenario 'A user can\'t request the same booking twice' do
    sign_up
    list_space_with_date
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2017-02-13"
    fill_in 'date to', with: "2017-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2017-02-13"
    fill_in 'date to', with: "2017-02-14"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(0)
  end

  scenario 'it removes the date booked' do
    list_space_with_date
    click_button 'Book 13/02/2018'
    expect(current_path).to eq '/spaces'
    expect(page).not_to have_content '13/02/2018'
    expect(AvailabilitySpace.count).to eq 2
  end
end

feature 'search for a space' do
	scenario 'a user can search by available dates' do
		list_space_with_date
		visit '/spaces/new'
		fill_in 'name', with: 'Alex\'s space'
		fill_in 'description', with: 'reasonable'
		fill_in 'price', with: '£55'
		fill_in 'availability', with: '18/05/2018, 20/12/2018, 01/01/2019'
		click_button 'List space'
		expect(page).to have_field("check_availability")
		fill_in 'check_availability', with: '18/05/2018'
		click_button 'Search'
		expect(page).to have_content 'Alex\'s space'
		expect(page).to_not have_content 'Ed\'s space'
	end
end
