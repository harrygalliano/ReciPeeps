feature 'Sign_up page' do
    scenario 'indicates the password do not match' do
      visit '/users/new'
      fill_in 'user_name', with: 'Test Name'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '1234567'
      click_button 'Create'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  

    scenario 'checks that the user enters a name' do
      visit '/users/new'
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button 'Create'
      expect(page).to have_content 'Name can\'t be blank'
    end



    scenario 'checks that the user enters an email' do
      visit '/users/new'
      fill_in 'user_name', with: 'Harry'
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button 'Create'
      expect(page).to have_content 'Email can\'t be blank'
    end


    scenario 'checks that the user enters a password' do
      visit '/users/new'
      fill_in 'user_name', with: 'Harry'
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      click_button 'Create'
      expect(page).to have_content 'Password can\'t be blank'
    end


    scenario 'checks that the user enters a password that is long enough' do
      visit '/users/new'
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: 'test@test.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Create'
      expect(page).to have_content 'Password is too short (minimum is 6 characters)'
    end
end