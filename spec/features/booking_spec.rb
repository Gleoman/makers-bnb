feature 'user can book a space' do
  scenario 'it removes the date booked' do
    list_space_with_date
    click_button 'Book 13/02/2018'
    expect(current_path).to eq '/spaces'
    expect(page).not_to have_content '13/02/2018'
    expect(AvailabilitySpace.count).to eq 2
  end
end

feature 'a user can request to book a space' do
  scenario 'A user can request to book a space' do
    list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
    visit '/spaces'
    click_link 'Book space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Book Space'
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
