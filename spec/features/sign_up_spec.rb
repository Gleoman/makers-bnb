feature 'sign up' do
  scenario 'filling in a form' do
    sign_up
    expect(page).to have_content('Hello Ed')
    expect(current_path).to eq '/'
  end

  scenario 'user tries to sign-up twice with same details' do
    sign_up
    expect { sign_up } .to change(User, :count). by(0)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'Expect user count to have increased by one' do
    expect { sign_up } .to change(User, :count). by(1)
  end

  scenario 'user cannot sign up with blank email address' do
    expect{ sign_up_blank_email }.not_to change { User.count }
    expect(page).to have_content "Email address must not be blank"
  end

  scenario 'user signs up with a preregistered email address' do
    sign_up
    expect{ sign_up }.not_to change { User.count }
    expect(page).to have_content "Email address is already taken"
  end
end

  feature 'User receives a welcome email on sign up' do
    scenario 'user successfully signs up to service' do
    sign_up
    expect(Mailer).to have_received(:call).with(User.first)
  end
end
