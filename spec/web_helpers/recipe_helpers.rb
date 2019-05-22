# frozen_string_literal: true

def create_recipe
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
end

def create_recipe_2
  visit "/recipes/new"
  fill_in "recipe_name", with: "Test recipe name 2"
  fill_in "recipe_description", with: "Test recipe description 2"
  fill_in "recipe_servings", with: 2
  fill_in "recipe_preparation_time", with: "01:30"
  click_button "Create"
  fill_in "ingredients_1[name]", with: "ingredient name 2"
  fill_in "ingredients_1[value]", with: 200
  fill_in "ingredients_1[unit]", with: "ml"
  click_button "Submit"
  fill_in "steps_1[description]", with: "test description 2"
  click_button "Submit"
end
