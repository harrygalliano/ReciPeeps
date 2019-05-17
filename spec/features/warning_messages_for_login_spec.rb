feature 'Login Page' do

  scenario 'checks that the user enters an email' do
    visit '/login'
    fill_in 'session_email', with: ''
    fill_in 'session_password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email/password combination.'
  end

  scenario 'checks that the user enters a password' do
    visit '/login'
    fill_in 'session_email', with: 'test@test.com'
    fill_in 'session_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid email/password combination.'
  end

  scenario 'checks that the user enters a long enough email' do
    visit '/login'
    fill_in 'session_email', with: 'test@test.com'
    fill_in 'session_password', with: '123'
    click_button 'Log in'
    expect(page).to have_content 'Invalid email/password combination.'
  end

end
