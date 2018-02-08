feature 'sign up' do
  scenario 'filling in a form' do
    sign_up
    expect(page).to have_content('Hello Ed')
    expect(current_path).to eq '/users'
  end

  scenario 'user tries to sign-up twice with same details' do
    sign_up
    expect { sign_up } .to change(User, :count). by(0)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'Expect user count to have increased by one' do
    expect { sign_up } .to change(User, :count). by(1)
  end
end
