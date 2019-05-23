# frozen_string_literal: true

feature "Recipes have images" do
  before(:each) do
    sign_up
    log_in
  end

  scenario "I can add an image when creating a recipe and see it on index" do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    attach_file("recipe_image", Rails.root + "public/apple-touch-icon.png")
    click_button "Submit Recipe"
    visit "/recipes"
    expect(page.html).to include '<img class="recipe_image_index"'
  end

  scenario "add an image when creating a recipe and see it on recipe show page", js: true do
    visit "/recipes/new"
    fill_in "recipe_name", with: "Test recipe name"
    fill_in "recipe_description", with: "Test recipe description"
    attach_file("recipe_image", Rails.root + "public/apple-touch-icon.png")
    click_button "Submit Recipe"
    fill_in "ingredients_1[name]", with: "ingredient name"
    fill_in "ingredients_1[value]", with: 100
    fill_in "ingredients_1[unit]", with: "g"
    click_button "Submit"
    fill_in "steps_1[description]", with: "test description"
    click_button "Submit"
    expect(page.html).to include '<img class="recipe-show-image"'
  end
end
