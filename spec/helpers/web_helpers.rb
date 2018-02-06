
def sign_up
  visit '/'
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
