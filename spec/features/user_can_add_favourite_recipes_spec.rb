# frozen_string_literal: true

feature "User can add recipes to favourites", js: true do
  scenario "logged in user can add recipe to favourites" do
    sign_up
    log_in
    create_recipe
    create_recipe_2
    click_button "Favourite"
    visit "/mycookbook"
    expect(page).to have_content "Test recipe name 2"
    expect(page).to_not have_content "Test recipe name", exact: true
  end

  scenario "logged in user can remove recipe from favourites" do
  sign_up
  log_in
  create_recipe
  click_button "Favourite"
  visit "/mycookbook"
  expect(page).to have_content "Test recipe name"
  click_button "Unfavourite"
  expect(page).to_not have_content "Test recipe name"
end
end
