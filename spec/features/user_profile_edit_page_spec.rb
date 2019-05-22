# frozen_string_literal: true

feature "Edit User Page" do
  before(:each) do
    sign_up
    log_in
  end

  scenario "User can add a description to their profile" do
    click_link "Edit profile"
    fill_in "user_name", with: "Test Name"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    fill_in "user_description", with: "Test Description"
    click_button "Save changes"
    expect(page).to have_content "Test Description"
  end

  scenario "Raises error if Name is blank" do
    click_link "Edit profile"
    fill_in "user_name", with: ""
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    fill_in "user_description", with: "Test Description"
    click_button "Save changes"
    expect(page).to have_content "Name can't be blank"
  end

  scenario "Raises error if Email is blank" do
    click_link "Edit profile"
    fill_in "user_name", with: "Test Name"
    fill_in "user_email", with: ""
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    fill_in "user_description", with: "Test Description"
    click_button "Save changes"
    expect(page).to have_content "Email can't be blank"
  end

  scenario "Does not raise error if Description is blank" do
    click_link "Edit profile"
    fill_in "user_name", with: "Test Name"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    fill_in "user_description", with: ""
    click_button "Save changes"
    expect(page).to have_link "Edit profile"
  end
end
