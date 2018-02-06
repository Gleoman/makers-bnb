feature 'a user can list space' do
  scenario 'user can post a space' do
    visit'/spaces/new'
    expect(page).to have_content('Enter space details')
    list_space("My space")
    expect(page).to have_content("My space listed")
    expect(current_path).to eq '/spaces'
  end

  scenario 'posted list increases list count by one' do
    list_space('My space')
    expect(Space.count).to eq 1
  end

  scenario 'listing multiple spaces' do
    list_space("Lewis's space")
    list_space("Leigh-Ann's space")
    expect(page).to have_content "Lewis's space" && "Leigh-Ann's space"
  end
end
