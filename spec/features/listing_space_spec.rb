feature 'a user can list space' do
  scenario 'user can post a space' do
    visit'/spaces/new'
    expect(page).to have_content('Enter space details')
  end

  scenario 'posted list increases list count by one' do
    list_space('My space', 'description', '40')
    expect(Space.count).to eq 1
  end

  scenario 'listing multiple spaces' do
    list_space("Lewis's space", "description", "1")
    list_space("Leigh-Ann's space", "description 2", "2")
    expect(page).to have_content "Lewis's space" && "Leigh-Ann's space"
  end

  scenario 'space has a name, description and price' do
    visit '/spaces/new'
    list_space("Phil's space", "A decadent room compelete with hot tub and water bed", "£2,000")
    expect(page).to have_content "Phil's space" && "A decadent room compelete with hot tub and water bed" && "£2,000"
  end

  scenario 'adding availability to a space' do
    list_space_with_date
    expect(Availability.count).to eq 3
    expect(page).to have_content '13/02/2018' && '14/02/2018' && '15/02/2018'
  end

	scenario 'adding pictures to a space' do
		visit '/spaces/new'
		fill_in 'name', with: 'Ed\'s space'
		fill_in 'description', with: 'small'
		fill_in 'price', with: '£50'
		fill_in 'availability', with: '13/2/2018, 14/2/2018, 15/02/2018'
		fill_in 'picture_url', with: 'https://i.imgur.com/NAymlu5.jpg'
		click_button 'List space'
		expect(page).to have_css("img[src*='https://i.imgur.com/NAymlu5.jpg']")
	end
end
