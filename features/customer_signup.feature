Feature: Customer Sign Up

  As a customer
  I want to be able sign up to Minishop
  So that I can ask for electricity supply at my property

  Scenario: New Customer Sign up
  Given I am at Minishop home page
  When I click "Sign Up" link
  Then I should be redirected to "Sign Up" main page
  And I should see content "Join Minishop"
  When I fill in "First name" with "John"
  And I fill in "Last name" with "Doe"
  And I fill in "Phone number" with "0214587896"
  And I fill in "Card number" with "1112444577789996"
  And I click "Next >"
  Then I should see content "Email"
  When I fill in "Email" with "john.doe@email.com"
  And I click "Next >"
  Then I should see content "Add a property"
  When I fill in "Number" with "11"
  And I fill in "Street name" with "Test Street"
  And I fill in "Suburb" with "Newtown"
  And I fill in "City" with "Wellington"
  And I fill in "Region" with "Wellington"
  And I fill in "Postcode" with "6021"
  And I fill in "Icp number" with "ICP123456789"
  And I click "Add"
  Then I should see 11 Test Street Wellington in the Added Properties table 
  When I click "Next >" link
  Then I should see content "What's next ?"
  When I click "Proceed to Login" link
  Then I should be redirected to "Log In" main page



   