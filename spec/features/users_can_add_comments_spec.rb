feature 'Add comments to recipes' do

  before(:each) do
    sign_up
    log_in
    create_recipe
  end

  scenario 'Logged in user can add comments to recipes', js: true do
    sign_up_2
    log_in_2
    visit '/recipes'
    click_link 'Test recipe name'
    fill_in 'comment', with: 'Test comment'
    click_button 'Submit'
    expect(page).to have_content 'Test recipe name'
    expect(page).to have_content 'Test comment'
  end

  scenario 'Commenter name is displayed with comment', js: true do
    sign_up_2
    log_in_2
    visit '/recipes'
    click_link 'Test recipe name'
    fill_in 'comment', with: 'Test comment'
    click_button 'Submit'
    expect(page).to have_content 'Test Name 2'
  end
end
