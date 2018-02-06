feature 'User log in' do

  let!(:user) do
    User.create(name: 'Ed',
                username: 'Ed',
                password: 'Banana')
  end

  scenario 'with correct credentials' do
    log_in
    expect(page).to have_content "Welcome, Ed"
  end
  scenario 'with incorrect credentials' do
    log_in(password: 'Courgette')
    expect(page).to have_content "Please sign in Username"
  end
end


# feature 'User signs out' do
#
#   before(:each) do
#     User.create(email: 'test@test.com',
#                 password: 'test',
#                 password_confirmation: 'test')
#   end
#
#   scenario 'while being signed in' do
#     sign_in(email: 'test@test.com', password: 'test')
#     click_button 'Sign out'
#     expect(page).to have_content('goodbye!')
#     expect(page).not_to have_content('Welcome, test@test.com')
#   end
