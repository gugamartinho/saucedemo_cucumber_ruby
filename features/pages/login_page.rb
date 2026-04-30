class LoginPage < SitePrism::Page
  # Defines the base URL (for SauceDemo it is the root '/')
  # This allows us to use the load method without parameters to navigate to the login page
  set_url '/'

  # Element Mapping
  element :username_field, '#user-name'
  element :password_field, '#password'
  element :login_button, '#login-button'
  element :error_container, '[data-test="error"]'

  # Fills in the login fields and clicks the login button
  def login(username, password)
    username_field.set username
    password_field.set password
    login_button.click
  end

  # Returns the displayed error message, if any
  def error_message
    error_container.text
  end

  # Checks if the error message is currently displayed
  def error_displayed?
    has_error_container?
  end
end