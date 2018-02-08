def sign_up
  visit '/users/new'
  fill_in('password', :with => 'password1')
  fill_in('name', :with => 'Ed')
  fill_in('username', :with => 'ed01')
  click_button 'Sign up'
end

def list_space(name, description, price)
  visit '/spaces/new'
  fill_in 'name', with: name
  fill_in 'description', with: description
  fill_in 'price', with: price
  click_button 'List space'
end

def list_space_with_date
  visit '/spaces/new'
  fill_in 'name', with: 'Ed\'s space'
  fill_in 'description', with: 'small'
  fill_in 'price', with: '£50'
  fill_in 'availability', with: '13/2/2018, 14/2/2018, 15/02/2018'
  click_button 'List space'
end

def log_in(username: 'Ed', password: 'Banana')
  visit '/sessions/new'
  fill_in('password', with: password)
  fill_in('username', with: username)
  click_button 'Log in'
end

def list_space_with_date2
 visit '/spaces/new'
 fill_in 'name', with: 'Ed\'s space'
 fill_in 'description', with: 'small'
 fill_in 'price', with: '£50'
 fill_in 'availability', with: '13/2/2018' #, 14/2/2018, 15/02/2018'
 click_button 'List space'
end
