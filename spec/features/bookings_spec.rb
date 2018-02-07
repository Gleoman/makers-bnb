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


  # scenario 'A user can request to book a space' do
  #   list_space('Bob\'s Space', 'Shed at bottom of garden', 1)
  #   visit '/spaces'
  #   click_link 'Book space'
  #   fill_in 'name', with: "Lewis"
  #   fill_in 'email address', with: 'lewis@gmail.com'
  #   fill_in ''
  # end
end
