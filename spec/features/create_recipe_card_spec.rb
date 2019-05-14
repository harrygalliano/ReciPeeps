feature 'Create recipe card' do
  scenario 'I can begin creating a recipe by inputting a name and description' do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'
    expect(page).to have_content 'Add Ingredients'
  end
end
