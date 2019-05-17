feature 'New Recipe Page' do

  scenario 'checks that the user enters a recipe description' do
    visit '/recipies/new'
    fill_in 'recipies_name', with: ''
    fill_in 'recipies_description', with: ''
    click_button 'Create'
    expect(page).to have_content 'Cannot submit empty field'
  end


end
