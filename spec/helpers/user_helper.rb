module UserHelpers
  def sign_up
    visit '/'
    fill_in('password', :with => 'password1')
    fill_in('name', :with => 'Ed')
    fill_in('username', :with => 'ed01')
    click_button 'Sign up'
  end
end
