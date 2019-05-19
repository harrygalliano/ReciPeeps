def sign_up
  visit '/users/new'
  fill_in 'user_name', with: 'Test Name'
  fill_in 'user_email', with: 'test@test.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Create'
end

def log_in
  visit '/login'
  fill_in 'session_email', with: 'test@test.com'
  fill_in 'session_password', with: '123456'
  click_button 'Log in'
end

def sign_up_2
  visit '/users/new'
  fill_in 'user_name', with: 'Test Name 2'
  fill_in 'user_email', with: 'test2@test.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Create'
end

def log_in_2
  visit '/login'
  fill_in 'session_email', with: 'test2@test.com'
  fill_in 'session_password', with: '123456'
  click_button 'Log in'
end
