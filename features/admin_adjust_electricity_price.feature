Feature: Adjusting electricity price per kWh

   As an Admin
   I want to be able to adjust the electricity price per kWh
   So that I can invoice our customers based on their usage.

   Scenario: Admin adjusting electricity price.
   Given I am logged in as "admin"
   Then I should see content "Electricity Price"
   When I click "Electricity Price" link
   Then I should see content "Electricity Price"
   And I should see field "Price"
   When I fill in "Price" with "30.75"
   And I click "Save" at "Price" input group 
   Then I should see "Price" field as "30.75"
   And I should see content "Price update successful"

   