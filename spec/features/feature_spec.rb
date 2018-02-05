feature 'user can sign up' do
  scenario 'user sees text' do
    visit '/'
    expect(page).to have_content('Sign up')
  end
end
