Feature: Adjusting electricity price per kWh

   As an Admin
   I want to be able to adjust the electricity price per kWh
   So that I can invoice our customers based on their usage.

   Scenario: Admin adjusting electricity price.
   Given I am logged in as "admin"
   When I click "Properties" link
   And I click "View" in the first row of the properties table
   Then I should see content "Meter Reading"
   When I fill in "Reading" with "1235.25"
   And I click "Save" at "Reading" input group 
   Then I should see "Reading" field as "1235.25"

   