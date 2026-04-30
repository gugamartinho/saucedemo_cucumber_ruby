require_relative '../pages/cart_page'

# Step definitions for cart-related actions and assertions
When('I go to the cart page') do
  @cart_page.load
end

# Then step to verify the number of items in the cart
Then('the cart should have {int} items') do |count|
  expect(@cart_page.item_count).to eq(count)
end

# When step to remove an item from the cart based on its name
When('I remove {string} from the cart') do |item_name|
  @cart_page.remove_item(item_name)
end

# When step to proceed to checkout from the cart page
When('I proceed to checkout') do
  @cart_page.proceed_to_checkout
end

#
Then('I should be on the checkout page') do
  expect(current_url).to include('/checkout-step-one.html')
end

# When step to continue shopping from the cart page
Then('I should be on the cart page') do
  expect(current_url).to include('/cart.html')
end
