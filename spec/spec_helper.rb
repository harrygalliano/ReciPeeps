# frozen_string_literal: true

require "capybara"
require "capybara/rspec"
require "rspec"
require "simplecov"
require "simplecov-console"
require "coveralls"
require "selenium-webdriver"
require_relative "web_helpers/user_helpers.rb"
require_relative "web_helpers/recipe_helpers.rb"

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { "args" => %w[headless disable-gpu] }
  )
  # profile = Selenium::WebDriver::Firefox::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 120 # instead of the default 60
  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :headless_chrome

system("clear")

Coveralls.wear!("rails")

SimpleCov.start do
  "rails"
  add_filter "app/channels/application_cable/connection.rb"
  add_filter "app/controllers/application_controller.rb"
  add_filter "app/channels/application_cable/channel.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/mailers/application_mailer.rb"
  add_filter "app/models/application_record.rb"
  add_filter "spec/rails_helper.rb"
  add_filter "app/helpers"
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 Coveralls::SimpleCov::Formatter,
                                                                 SimpleCov::Formatter::Console
                                                               ])

RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
