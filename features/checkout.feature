Feature: Checkout

  Background:
    Given I am logged in as "standard_user"
    And I add "Sauce Labs Backpack" to the cart
    And I go to the cart page
    And I proceed to checkout

  Scenario: Complete full checkout flow
    When I fill checkout form with "David" "Martinho" "2000-105"
    And I continue to order summary
    Then I should see the order total
    When I finish the order
    Then I should see the confirmation message

  Scenario: Error when first name is missing
    When I fill checkout form with "" "Martinho" "2000-105"
    And I continue to order summary
    Then I should see a checkout error containing "First Name is required"

  Scenario: Error when last name is missing
    When I fill checkout form with "David" "" "2000-105"
    And I continue to order summary
    Then I should see a checkout error containing "Last Name is required"

  Scenario: Error when postal code is missing
    When I fill checkout form with "David" "Martinho" ""
    And I continue to order summary
    Then I should see a checkout error containing "Postal Code is required"

  Scenario: Cancel checkout returns to cart
    When I cancel the checkout
    Then I should be on the cart page

  Scenario: Correct item appears in order summary
    When I fill checkout form with "David" "Martinho" "2000-105"
    And I continue to order summary
    Then I should see "Sauce Labs Backpack" in the order summary
