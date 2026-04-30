require_relative '../pages/checkout_page'

# Step definitions for checkout-related actions and assertions
When('I fill checkout form with {string} {string} {string}') do |first_name, last_name, postal_code|
  @checkout_page.fill_form(first_name, last_name, postal_code)
end

# Then step to verify that we are on the checkout page
When('I continue to order summary') do
  @checkout_page.continue
end

#
When('I finish the order') do
  @checkout_page.finish
end

#
When('I cancel the checkout') do
  @checkout_page.cancel
end

#
Then('I should see the order total') do
  expect(@checkout_page.summary_total).to include('$')
end

#
Then('I should see the confirmation message') do
  expect(@checkout_page.confirmation_message).to include('Thank you')
end

#
Then('I should see a checkout error containing {string}') do |message|
  expect(@checkout_page.error_message).to include(message)
end

# Then step to verify that a specific item is listed in the order summary
Then('I should see {string} in the order summary') do |item_name|
  expect(@checkout_page.summary_item_names).to include(item_name)
end
