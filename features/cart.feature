Feature: Cart

  Background:
    Given I am logged in as "standard_user"

  Scenario: Cart is empty by default
    When I go to the cart page
    Then the cart should have 0 items

  Scenario: Cart shows added items
    When I add "Sauce Labs Backpack" to the cart
    And I add "Sauce Labs Bike Light" to the cart
    And I go to the cart page
    Then the cart should have 2 items

  Scenario: Remove item from cart
    When I add "Sauce Labs Backpack" to the cart
    And I go to the cart page
    And I remove "Sauce Labs Backpack" from the cart
    Then the cart should have 0 items

  Scenario: Proceed to checkout
    When I add "Sauce Labs Backpack" to the cart
    And I go to the cart page
    And I proceed to checkout
    Then I should be on the checkout page
