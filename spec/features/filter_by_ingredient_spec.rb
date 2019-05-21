feature 'Filtering by ingredient' do

  before(:each) do
      sign_up
      log_in
  end
  
  scenario 'I can filter by ingredient', js: true do
      create_recipe
      visit '/recipes/new'
      fill_in 'recipe_name', with: 'Pasta Bake'
      fill_in 'recipe_description', with: 'Test recipe description'
      click_button 'Create'
      fill_in 'ingredients_1[name]', with: 'pasta'
      fill_in 'ingredients_1[value]', with: 100
      fill_in 'ingredients_1[unit]', with: 'g'
      click_button 'Submit'
      fill_in 'steps_1[description]', with: 'test description'
      click_button 'Submit'
      visit '/'
      fill_in 'search_bar_input', with: 'pasta'
      click_button 'Search'
      expect(page).to have_content 'Displaying 1 Recipe'
      expect(page).to have_content 'Pasta Bake'
  end
end