feature 'user can book a space' do
  scenario 'it removes the date booked' do
    list_space_with_date
    click_button 'Book 13/02/2018'
    expect(current_path).to eq '/spaces'
    expect(page).not_to have_content '13/02/2018'
    expect(AvailabilitySpace.count).to eq 2
  end
end
