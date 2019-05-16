feature 'Create recipe card with multiple ingredients' do

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

  scenario 'I can remove ingredients to a recipe I have started to make', js: true do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'

    click_button 'More Ingredients'
    click_button 'More Ingredients'

    fill_in 'ingredients_1[name]', with: 'test name'
    fill_in 'ingredients_1[value]', with: 1
    fill_in 'ingredients_1[unit]', with: 'g'
    fill_in 'ingredients_2[name]', with: 'test name 2'
    fill_in 'ingredients_2[value]', with: 2
    fill_in 'ingredients_2[unit]', with: 'g'
    fill_in 'ingredients_3[name]', with: 'test name 3'
    fill_in 'ingredients_3[value]', with: 3
    fill_in 'ingredients_3[unit]', with: 'g'
    click_button 'Less Ingredients '
    expect{ page.find(:css, "#ingredients_2_name") }.to_not raise_error Capybara::ElementNotFound
    expect{ page.find(:css, "#ingredients_3_name") }.to raise_error Capybara::ElementNotFound
  end
end
