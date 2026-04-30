Feature: Inventory

  Background:
    Given I am logged in as "standard_user"

  Scenario: Display 6 products
    Then I should see 6 products

  Scenario: Add item to cart
    When I add "Sauce Labs Backpack" to the cart
    Then the cart count should be "1"

  Scenario: Add multiple items to cart
    When I add "Sauce Labs Backpack" to the cart
    And I add "Sauce Labs Bike Light" to the cart
    Then the cart count should be "2"

  Scenario: Sort products A to Z
    When I sort products by "Name (A to Z)"
    Then products should be sorted alphabetically ascending

  Scenario: Sort products Z to A
    When I sort products by "Name (Z to A)"
    Then products should be sorted alphabetically descending

  Scenario: Sort products by price low to high
    When I sort products by "Price (low to high)"
    Then products should be sorted by price ascending

  Scenario: Sort products by price high to low
    When I sort products by "Price (high to low)"
    Then products should be sorted by price descending

  Scenario: Logout
    When I logout
    Then I should be on the login page
