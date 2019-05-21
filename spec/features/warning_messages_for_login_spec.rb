feature 'Login Page' do
  scenario 'checks that the user enters an email' do
    sign_up
    visit '/login'
    fill_in 'session_email', with: ''
    fill_in 'session_password', with: '123456'
    click_button 'Log in'
    expect(page.html).to include 'class="sessions new"'
  end

  scenario 'checks that the user enters a password' do
    sign_up
    visit '/login'
    fill_in 'session_email', with: 'test@test.com'
    fill_in 'session_password', with: ''
    click_button 'Log in'
    expect(page.html).to include 'class="sessions new"'
  end
end
