Feature: Customer Login
  As a registered customer
  I want to be able to login to Minishop website
  So that I can manage my account

  Scenario: Customer Sign in
  Given I am at Minishop home page
  When I click "Login" link
  Then I should be redirected to "Log In" main page
  When I fill in "Email" with "bow@gmail.com"
  And I fill in "Password" with "abcd"
  And I click "Log In"
  Then I should be redirected to "Customer" main page