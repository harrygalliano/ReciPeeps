feature 'Create recipe card with multiple ingredients' do

  before(:each) do
    sign_up
    log_in
  end
  
  scenario 'I can add multiple ingredients to a recipe I have started to make', js: true do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'

    click_button 'More Ingredients'

    fill_in 'ingredients_1[name]', with: 'test name'
    fill_in 'ingredients_1[value]', with: 1
    fill_in 'ingredients_1[unit]', with: 'g'
    fill_in 'ingredients_2[name]', with: 'test name'
    fill_in 'ingredients_2[value]', with: 1
    fill_in 'ingredients_2[unit]', with: 'g'
    click_button 'Submit'
    expect(page).to have_content 'Add Method'
  end
end
