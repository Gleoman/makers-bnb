feature 'a user can list space' do
  scenario 'user can post a space' do
    visit'/spaces/new'
    expect(page).to have_content('Enter space details')
    fill_in 'name', with: 'My space'
    click_button 'List space'
    expect(page).to have_content("My space listed")
    expect(current_path).to eq '/spaces'
  end

  scenario 'posted list increases list count by one' do
    visit '/spaces/new'
    fill_in 'name', with: 'My space'
    click_button 'List space'
    expect(Space.count).to eq 1
  end

  scenario 'listing multiple spaces' do
    visit '/spaces/new'
    fill_in 'name', with: "Lewis's space"
    click_button 'List space'
    visit '/spaces/new'
    fill_in 'name', with: "Leigh-Ann's space"
    click_button 'List space'

    expect(page).to have_content "Lewis's space" && "Leigh-Ann's space"
  end
end
