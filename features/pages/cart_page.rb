class CartPage < SitePrism::Page
  # Defines the relative URL for the load method
  # This allows us to navigate to the cart page using @cart_page.load
  set_url '/cart.html'

  # Element mapping
  elements :cart_items, '.cart_item'
  element :checkout_button, '[data-test="checkout"]'
  element :continue_shopping_button, '[data-test="continue-shopping"]'

  # Action methods
  def item_count
    cart_items.count
  end

  # Method to remove an item from the cart based on the item name
  def remove_item(item_name)
    item = cart_items(text: item_name).first
    item.find('button', text: 'Remove').click
  end

  # Method to proceed to checkout
  def proceed_to_checkout
    checkout_button.click
  end

  # Method to continue shopping
  def continue_shopping
    continue_shopping_button.click
  end
end