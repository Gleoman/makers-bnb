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
