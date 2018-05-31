Feature: Admin Sign In
  As an admin
  I want to be able to login to Minishop
  So that I can perform administration tasks

  Scenario: Admin Sign in
  Given I am at "Minishop home" page
  When I click "Sign In" link
  Then I should be redirected to "Sign In" page