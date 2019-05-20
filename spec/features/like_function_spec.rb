feature 'Likes on the Homepage' do

  before(:each) do
    sign_up
    log_in
  end

  scenario 'Changes the like count to 1 after liking', js: true do
    create_recipe
    visit '/'
    click_button 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'Changes the like count to 0 after unliking', js: true do
    create_recipe
    visit '/'
    click_button 'Like'
    click_button 'Unlike'
    expect(page).to have_content '0 Likes'
  end

end
