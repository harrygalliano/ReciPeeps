feature 'New Recipe Page' do

  before(:each) do
    sign_up
    log_in
  end

  scenario 'checks that the user enters a recipe description' do
    visit '/recipes/new'
    fill_in 'recipe_name', with: 'Test recipe name'
    fill_in 'recipe_description', with: ''
    click_button 'Create'
    expect(page).to have_content 'Cannot submit empty field.'
  end

end
