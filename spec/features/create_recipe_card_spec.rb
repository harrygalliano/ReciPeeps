feature 'Create recipe card' do


  scenario 'I can begin creating a recipe by inputting a name and description' do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'
    expect(page).to have_content 'Add Ingredients'
  end

  xscenario 'I can add ingredients to a recipe I have started to make', js: true do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'

    fill_in 'ingredients_1[name]', with: 'test name'
    fill_in 'ingredients_1[value]', with: 1
    fill_in 'ingredients_1[unit]', with: 'g'
    click_button 'Add'
    expect(page).to have_content 'Add Method'
  end

  xscenario 'I can add method steps to a recipe I have started to make' do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'
    fill_in 'ingredient_name', with: 'test name'
    fill_in 'ingredient_value', with: 1
    fill_in 'ingredient_unit', with: 'g'
    click_button 'Add'

    fill_in 'step_description', with: 'test description'
    click_button 'Add'
    expect(page).to have_content 'Test recipe name'
  end
end
