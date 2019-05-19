def create_recipe
  visit '/recipes/new'
  fill_in 'recipe_name', with: 'Test recipe name'
  fill_in 'recipe_description', with: 'Test recipe description'
  click_button 'Create'
  fill_in 'ingredients_1[name]', with: 'ingredient name'
  fill_in 'ingredients_1[value]', with: 100
  fill_in 'ingredients_1[unit]', with: 'g'
  click_button 'Submit'
  fill_in 'steps_1[description]', with: 'test description'
  click_button 'Submit'
end
