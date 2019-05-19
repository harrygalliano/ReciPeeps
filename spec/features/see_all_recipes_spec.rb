feature 'see recipes displayed on index' do

  before(:each) do
    sign_up
    log_in
  end

  scenario 'I see all recipes when I visit index', js: true do
    create_recipe

    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name 2'
    fill_in 'recipe_description', with: 'Test recipe description 2'
    click_button 'Create'
    fill_in 'ingredients_1[name]', with: 'ingredient name 2'
    fill_in 'ingredients_1[value]', with: 200
    fill_in 'ingredients_1[unit]', with: 'oz'
    click_button 'Submit'
    fill_in 'steps_1[description]', with: 'test description 2'
    click_button 'Submit'

    visit '/recipes'

    expect(page).to have_content 'Test recipe name'
    expect(page).to have_content 'Test recipe description'

    expect(page).to have_content 'Test recipe name 2'
    expect(page).to have_content 'Test recipe description 2'
  end

  scenario 'Recipes are links', js: true do
    create_recipe
    visit '/recipes'
    click_link 'Test recipe name'
    expect(page).to have_content 'ingredient name'
  end

  scenario 'Pagination is working', js: true do
    15.times { create_recipe }
    visit '/recipes'
    expect(page).to have_content 'Displaying Recipe 1 - 10 of 15 in total'
    expect(page).to have_content '← Previous - 1 - 2 - Next →'
    expect(page.all('div.recipe').length).to eq 10
  end
end
