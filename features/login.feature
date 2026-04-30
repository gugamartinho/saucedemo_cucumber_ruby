Feature: Login

  Background:
    Given I am on the login page

  Scenario: Login with valid credentials
    When I login with username "standard_user" and password "secret_sauce"
    Then I should be on the inventory page

  Scenario: Login with locked out user
    When I login with username "locked_out_user" and password "secret_sauce"
    Then I should see an error containing "locked out"

  Scenario: Login with invalid credentials
    When I login with username "invalid_user" and password "wrong_password"
    Then I should see an error containing "Username and password do not match"

  Scenario: Login with empty username
    When I login with username "" and password "secret_sauce"
    Then I should see an error containing "Username is required"

  Scenario: Login with empty password
    When I login with username "standard_user" and password ""
    Then I should see an error containing "Password is required"
