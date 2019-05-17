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

  scenario 'I can remove steps to a recipe I have started to make', js: true do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: 'Test recipe description'
    click_button 'Create'

    click_button 'Submit'

    click_button 'More Steps'
    click_button 'More Steps'

    fill_in 'steps_1[description]', with: 'test description 1'
    fill_in 'steps_2[description]', with: 'test description 2'
    fill_in 'steps_3[description]', with: 'test description 3'
    click_button 'Less Steps '
    expect{ page.find(:css, "#steps_2_description") }.to_not raise_error Capybara::ElementNotFound, 'Unable to find css "#steps_2_description"'
    expect{ page.find(:css, "#steps_3_description") }.to raise_error Capybara::ElementNotFound, 'Unable to find css "#steps_3_description"'
  end
end
