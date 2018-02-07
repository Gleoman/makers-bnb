feature 'a user can request to book a space' do
  scenario 'A user can request to book a space' do
    list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
    visit '/spaces'
    click_link 'Book space'
    expect(current_path).to eq '/bookings/new'
    expect(page).to have_content 'Book Space'
  end
end
