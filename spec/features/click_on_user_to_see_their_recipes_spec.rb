feature 'See a users recipes', js: true   do

  before(:each) do
      sign_up
      log_in
  end

  scenario 'I can see recipe owners name with recipe on index' do
      create_recipe
      visit '/'
      expect(page).to have_content 'Test Name'
  end

  scenario 'Recipe owner name filters index by that user (index page)' do
        create_recipe
        click_link 'Log out'
        sign_up_2
        log_in_2
        create_recipe
        visit '/'
        click_link 'Test Name'
        expect(page).to have_content 'Displaying 1 Recipe'
        expect(page).to have_content 'Test Name'
  end

  scenario 'I can see recipe owners name with recipe on recipe page' do
      create_recipe
      visit '/'
      first('.recipe').click_link("Let's Cook!")
      expect(page).to have_content 'Test Name'
  end

  scenario 'Recipe owner name filters index by that user (recipe page)' do
        create_recipe
        click_link 'Log out'
        sign_up_2
        log_in_2
        create_recipe_2
        visit '/'
        first('.recipe').click_link("Let's Cook!")
        find('#user_filter_link').click
        expect(page).to have_content 'Displaying 1 Recipe'
        expect(page).to have_content 'Test Name'
  end

  scenario 'I can see which filter is currently being applied' do
      create_recipe
      visit '/'
      click_link 'Test Name'
      expect(page).to have_content 'Filtered by user: Test Name'
  end
end
