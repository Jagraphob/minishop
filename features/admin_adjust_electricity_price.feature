Feature: Adjusting electricity price per kWh

   As an Admin
   I want to be able to adjust the electricity price per kWh
   So that I can invoice our customers based on their usage.

   Scenario: Admin adjusting electricity price.
   Given I am logged in as "admin"
   Then I should see content "Price"
   When I click "Price" link
   Then I should see content "Update Price"
   When I fill in "Price" with "30.75"
   And I click "Save"
   Then I should see content "30.75 c/kwh"
   And I should see content "Price update successful"

   