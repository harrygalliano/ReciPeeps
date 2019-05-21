# frozen_string_literal: true

feature "Cannot create recipies when not logged in" do
  before(:each) do
    sign_up
  end

  scenario "Redirect to /login when attempting to view /recipies/new" do
    visit "/recipes/new"
    expect(page).to have_content "New user? Signup"
  end
end
