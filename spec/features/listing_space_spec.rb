feature 'a user can list space' do
  scenario 'user can post a space' do
    visit'/spaces/new'
    expect(page).to have_content('Enter space details')
    fill_in 'space', with: 'My space'
    click_button 'List space'
    expect(page).to have_content("My space listed")
    expect(current_path).to eq '/spaces'
  end
end
