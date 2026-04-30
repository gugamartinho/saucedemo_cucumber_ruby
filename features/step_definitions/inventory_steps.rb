require_relative '../pages/inventory_page'

# Step definitions for inventory-related actions and assertions
Then('I should see {int} products') do |count|
  expect(@inventory_page.item_count).to eq(count)
end

#
When('I add {string} to the cart') do |item_name|
  @inventory_page.add_item_to_cart(item_name)
end

#
Then('the cart count should be {string}') do |count|
  expect(@inventory_page.cart_count).to eq(count)
end

# Then step to verify that the cart is empty (no badge present)
When('I sort products by {string}') do |option|
  @inventory_page.sort_by(option)
end

# Then step to verify that products are sorted in alphabetical order
Then('products should be sorted alphabetically ascending') do
  names = @inventory_page.item_names
  expect(names).to eq(names.sort)
end

# Then step to verify that products are sorted in reverse alphabetical order
Then('products should be sorted alphabetically descending') do
  names = @inventory_page.item_names
  expect(names).to eq(names.sort.reverse)
end

# Then step to verify that products are sorted by price in ascending order
Then('products should be sorted by price ascending') do
  prices = @inventory_page.item_prices
  expect(prices).to eq(prices.sort)
end

# Then step to verify that products are sorted by price in descending order
Then('products should be sorted by price descending') do
  prices = @inventory_page.item_prices
  expect(prices).to eq(prices.sort.reverse)
end

# When step to perform logout action
When('I logout') do
  @inventory_page.logout
end
