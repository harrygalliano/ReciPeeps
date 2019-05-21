# frozen_string_literal: true

feature "Nav Bar" do
  scenario "New recipe button should link to new recipe page" do
    sign_up
    log_in
    page.find(:css, "#new_recipe_nav", visible: false).click
    expect(page.html).to include 'class="recipes new"'
  end

  scenario "Home link should link to recipes index" do
    visit "/users/new"
    page.find(:css, "#home_nav", visible: false).click
    expect(page.html).to include 'class="recipes index"'
  end

  scenario "login link should link to login page" do
    visit "/"
    page.find_by_id("log_in_nav", visible: false).click
    expect(page.html).to include 'class="sessions new"'
  end

  scenario "profile link should link to users show page" do
    visit "/"
    sign_up
    log_in
    page.find_by_id("profile_nav", visible: false).click
    expect(page.html).to include 'class="users show"'
  end

  scenario "log out link should link to login page" do
    visit "/"
    sign_up
    log_in
    page.find_by_id("log_out_nav", visible: false).click
    expect(page.html).to include 'class="sessions new"'
  end

  scenario "Can not see new recipe and profile links if not logged in" do
    visit "/"
    expect { page.find(:css, "#new_recipe_nav", visible: false) }.to raise_error(Capybara::ElementNotFound, 'Unable to find css "#new_recipe_nav"')
    expect { page.find(:css, "#profile_nav", visible: false) }.to raise_error(Capybara::ElementNotFound, 'Unable to find css "#profile_nav"')
  end

  scenario "Can not see log in link if logged in" do
    sign_up
    log_in
    expect { page.find(:css, "#log_in_nav", visible: false) }.to raise_error(Capybara::ElementNotFound, 'Unable to find css "#log_in_nav"')
  end

  scenario "Can see new recipe, profile, log out and home links when logged in" do
    sign_up
    log_in
    expect { page.find(:css, "#new_recipe_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
    expect { page.find(:css, "#profile_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
    expect { page.find(:css, "#log_out_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
    expect { page.find(:css, "#home_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
  end

  scenario "Can see home and log in links when not logged in" do
    visit "/"
    expect { page.find(:css, "#home_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
    expect { page.find(:css, "#log_in_nav", visible: false) }.to_not raise_error(Capybara::ElementNotFound)
  end
end
