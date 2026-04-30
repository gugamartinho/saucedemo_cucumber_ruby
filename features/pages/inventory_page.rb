class ProductCard < SitePrism::Section
  element :name, '.inventory_item_name'
  element :price, '.inventory_item_price'
  element :add_to_cart_button, 'button'
end

class InventoryPage < SitePrism::Page
  # Defines the relative URL for the load method, allowing navigation to the inventory page
  set_url '/inventory.html'

  # Global Elements
  element :cart_badge, '.shopping_cart_badge'
  element :sort_container, '[data-test="product-sort-container"]'
  element :burger_menu_btn, '#react-burger-menu-btn'
  element :logout_link, '#logout_sidebar_link'

  # Element Collections
  sections :products, ProductCard, '.inventory_item'
  elements :product_names, '.inventory_item_name'
  elements :product_prices, '.inventory_item_price'

  # Adds a specific item to the cart based on the product name
  def add_item_to_cart(item_name)
    product = products.find { |p| p.name.text == item_name }
    product.add_to_cart_button.click
  end

  # Returns the number of products displayed on the page
  def item_count
    products.count
  end

  # Returns the number of items in the cart, or nil if the badge is not present
  def cart_count
    cart_badge.text
  end

  # Checks if the cart is empty (no badge present)
  def cart_empty?
    has_no_cart_badge?
  end

  # Sorts the products based on the selected option
  def sort_by(option)
    sort_container.select(option)
  end

  # Returns the names of the products displayed on the page
  def item_names
    product_names.map(&:text)
  end

  # Returns the prices of the products displayed on the page as numbers (removing the dollar sign)
  def item_prices
    product_prices.map { |p| p.text.delete('$').to_f }
  end

  # Method to perform logout
  def logout
    burger_menu_btn.click
    logout_link.click
  end
end