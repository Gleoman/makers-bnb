feature 'sign up' do
  scenario 'filling in a form' do
    sign_up
    expect(page).to have_content('Welcome Ed')
    expect(current_path).to eq '/users'
  end

  scenario 'Expect user count to have increased by one' do
    expect { sign_up } .to change(User, :count). by(1)
  end
end
