feature 'a user can book a space' do

  scenario 'A can choose a space they want to book' do
    sign_up
    list_space_with_date2
    visit '/spaces'
    click_button 'Book Ed\'s space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Book Space'
  end

  scenario 'User cant book a space without signing in' do
    list_space_with_date2
    visit '/spaces'
    click_button 'Book Ed\'s space'
    expect(page).to have_content("You can't book without signing in")
  end

  scenario 'A user can request to book a space' do
    sign_up
    list_space_with_date2
    visit '/spaces'
    click_button 'Book Ed\'s space'
    fill_in 'date from', with: "2017-02-11"
    fill_in 'date to', with: "2017-02-12"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    expect(page).to have_content 'Booking @ Ed\'s space requested for 11/02/2017'
    expect(current_path).to eq '/bookings/request_confirmation'
  end

  scenario 'it removes the date booked' do
    list_space_with_date
    click_button 'Book 13/02/2018'
    expect(current_path).to eq '/spaces'
    expect(page).not_to have_content '13/02/2018'
    expect(AvailabilitySpace.count).to eq 2
  end
end
