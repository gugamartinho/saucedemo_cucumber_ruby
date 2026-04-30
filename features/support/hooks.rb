# Hooks for Cucumber tests, including setup and teardown actions
After do |scenario|
  if scenario.failed?
    timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
    screenshot_name = "#{scenario.name.gsub(/\s+/, '_')}_#{timestamp}.png"
    save_screenshot("screenshots/#{screenshot_name}")
    puts "Screenshot saved: screenshots/#{screenshot_name}"
  end
end

# Before hook para limpar sessões e cookies antes de cada cenário
Before do
  Capybara.reset_sessions!
end

# Initialize page objects before each scenario
Before do
  @cart_page = CartPage.new
  @login_page = LoginPage.new
  @checkout_page = CheckoutPage.new
  @inventory_page = InventoryPage.new
end
