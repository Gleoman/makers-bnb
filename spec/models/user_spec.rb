require './app/models/user'
describe User do
 let(:user) do
   User.create(name: 'John Smith', username: 'JSmith', password: 'password123', email_address: 'test123@test.com')
 end
   it 'authenticates when given a valid username and password' do
     authenticated_user = User.authenticate(user.username,'password123')
     expect(authenticated_user).to eq user
   end

   it 'does not authenticate when given an incorrect passsword' do
     expect(User.authenticate(user.username, "wrong_password")).to be_nil
   end
end
