feature 'a user can book a space' do
  scenario 'A can choose a space they want to book' do
    sign_up
    list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
    visit '/spaces'
    click_link 'Book space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Book Space'
  end

  scenario 'User cant book a space without signing in' do
    list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
    visit '/spaces'
    click_link 'Book space'
    expect(page).to have_content("You can't book without signing in")
  end

  scenario 'A user can request to book a space' do
    sign_up
    list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
    visit '/spaces'
    click_link 'Book space'
    fill_in 'date from', with: "11/02/2017"
    fill_in 'date to', with: "12/02/2017"
    expect { click_button 'Request to book' } .to change(Booking, :count). by(1)
    expect(page).to have_content 'Booking @ Bob\'s Space requested for 11/02/2017'
    expect(current_path).to eq '/bookings'
  end
end
