feature 'Create recipe card with multiple steps' do

  before(:each) do
    sign_up
    log_in
  end

  scenario 'I can add multiple steps to a recipe I have started to make', js: true do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'

    fill_in 'ingredients_1[name]', with: 'test name'
    fill_in 'ingredients_1[value]', with: 1
    fill_in 'ingredients_1[unit]', with: 'g'
    click_button 'Submit'

    click_button 'More Steps'
    fill_in 'steps_1[description]', with: 'test description 1'
    fill_in 'steps_2[description]', with: 'test description 2'
    click_button 'Submit'
    expect(page).to have_content 'Test recipe name'
  end
end
