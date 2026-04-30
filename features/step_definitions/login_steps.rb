require_relative '../pages/login_page'
require_relative '../pages/inventory_page'

# Step definitions for login-related actions and assertions
Given('I am on the login page') do
  @login_page.load
end

# Given step to perform login with a specific username (using a default password)
Given('I am logged in as {string}') do |username|
  @login_page.load
  @login_page.login(username, 'secret_sauce')
end

# When step to perform login with specific username and password
When('I login with username {string} and password {string}') do |username, password|
  @login_page.login(username, password)
end

# Then step to verify that we are on the inventory page after successful login
Then('I should be on the inventory page') do
  expect(current_url).to include('/inventory.html')
end

# Then step to verify that we are back on the login page after logout
Then('I should be on the login page') do
  expect(current_url).to eq('https://www.saucedemo.com/')
end

# Then step to verify that an error message is displayed containing specific text
Then('I should see an error containing {string}') do |message|
  expect(@login_page.error_message).to include(message)
end
