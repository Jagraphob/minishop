Feature: Customer view electricity price

   As a Customer
   I want to be able to see the electricity price
   So that I can know the current electricity rate.

   Scenario: Customer viewing the current electricity price
   Given I am logged in as "customer"
   Then I should see content "Current Electricity Price"

   