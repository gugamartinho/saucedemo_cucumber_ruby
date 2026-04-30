class CheckoutPage < SitePrism::Page
  # Defines the relative URL for the load method, allowing navigation to the checkout page
  set_url '/checkout-step-one.html'

  # Form Element Mapping
  element :first_name_field, '#first-name'
  element :last_name_field, '#last-name'
  element :postal_code_field, '#postal-code'

  # Buttons and Controls Mapping
  element :continue_button, '[data-test="continue"]'
  element :finish_button, '[data-test="finish"]'
  element :cancel_button, '[data-test="cancel"]'

  # Messages and Summary
  element :error_container, '[data-test="error"]'
  element :summary_total_label, '.summary_total_label'
  element :complete_header, '.complete-header'
  elements :inventory_item_names, '.inventory_item_name'

  # Fills out the checkout form with the provided data
  def fill_form(first_name, last_name, postal_code)
    first_name_field.set first_name
    last_name_field.set last_name
    postal_code_field.set postal_code
  end

  # Clicks the continue button to proceed to the next checkout step
  def continue
    continue_button.click
  end

  # Clicks the finish button to complete the checkout process
  def finish
    finish_button.click
  end

  # Clicks the cancel button to return to the previous page or cancel the checkout
  def cancel
    cancel_button.click
  end

  # Returns the displayed error message, if any
  def error_message
    error_container.text
  end

  # Checks if the error message is currently displayed
  def error_displayed?
    has_error_container?
  end

  # Returns the total summary value displayed on the checkout page
  def summary_total
    summary_total_label.text
  end

  # Returns the confirmation message displayed after finishing the checkout
  def confirmation_message
    complete_header.text
  end

  # Returns the names of the items listed in the checkout summary
  def summary_item_names
    inventory_item_names.map(&:text)
  end
end