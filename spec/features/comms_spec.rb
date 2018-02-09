feature 'a user can communicate with other parties on DwellBNB' do

	scenario 'a user can chat with the other side on DwellBNB once logged in' do
		log_in
		expect(page).to have_content
	end

end
