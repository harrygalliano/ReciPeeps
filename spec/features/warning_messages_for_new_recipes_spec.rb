# frozen_string_literal: true

feature "New Recipe Page" do
  before(:each) do
    sign_up
    log_in
  end

  scenario "checks that the user enters a recipe description" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: ""
    click_button "Create"
    expect(page).to have_content "Cannot submit empty field."
  end

  scenario "user can not submit ingredients with empty fields", js: true do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    click_button "Create"
    click_button "Submit"
    expect(page.html).to include 'class="ingredients new"'
  end
  scenario "user can not submit steps with empty fields", js: true do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    click_button "Create"
    fill_in "ingredients_1[name]", with: "test name"
    fill_in "ingredients_1[value]", with: 1
    fill_in "ingredients_1[unit]", with: "g"
    click_button "Submit"
    click_button "Submit"
    expect(page.html).to include 'class="steps new"'
  end
end
