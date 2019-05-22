# frozen_string_literal: true

feature "Create recipe card", js: true do
  before(:each) do
    sign_up
    log_in
  end

  scenario "I can begin creating a recipe by inputting a name and description" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    fill_in "recipe_servings", with: 2
    fill_in "recipe_preparation_time", with: "01:30"
    click_button "Create"
    expect(page).to have_content "Add Ingredients"
  end

  scenario "I can add ingredients to a recipe I have started to make" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    fill_in "recipe_servings", with: 2
    fill_in "recipe_preparation_time", with: "01:30"
    click_button "Create"

    fill_in "ingredients_1[name]", with: "test name"
    fill_in "ingredients_1[value]", with: 1
    fill_in "ingredients_1[unit]", with: "g"
    click_button "Submit"
    expect(page).to have_content "Add Method"
  end

  scenario "I can add method steps to a recipe I have started to make" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    fill_in "recipe_servings", with: 2
    fill_in "recipe_preparation_time", with: "01:30"
    click_button "Create"
    fill_in "ingredients_1[name]", with: "test name"
    fill_in "ingredients_1[value]", with: 1
    fill_in "ingredients_1[unit]", with: "g"
    click_button "Submit"

    fill_in "steps_1[description]", with: "test description"
    click_button "Submit"
    expect(page).to have_content "Test recipe name"
  end

  scenario "I can add a recipe and see it displayed" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    fill_in "recipe_servings", with: 2
    fill_in "recipe_preparation_time", with: "01:30"
    click_button "Create"
    fill_in "ingredients_1[name]", with: "ingredient name"
    fill_in "ingredients_1[value]", with: 100
    fill_in "ingredients_1[unit]", with: "g"
    click_button "Submit"

    fill_in "steps_1[description]", with: "test description"
    click_button "Submit"
    expect(page).to have_content "Test recipe name"
    expect(page).to have_content "Test recipe description"
    expect(page).to have_content "ingredient name - 100.0 g"
    expect(page).to have_content "test description"
    expect(page).to have_content 2
    expect(page).to have_content "01:30"
  end
end
