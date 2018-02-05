feature 'user can sign up' do
  scenario 'user sees text' do
    visit '/'
    expect(page).to have_content('Sign up')
  end

  scenario 'filling in a form' do
    visit '/'
    fill_in 'name', with: 'Ed'
    click_button 'Sign up'
    expect(page).to have_content('Welcome Ed')
    expect(current_path).to eq '/users'
  end
end
