Feature: Customer entering index kWh readings to the meter of a property

   As a Customer
   I want to be able to enter the meter reading of my property
   So that I can inform minishop how much electricity I have used.

   Scenario: Customer entering his/her property meter reading
   Given I am logged in as "customer"
   Then I should see content "Your Properties"
   When I click "Manage" in the first row of the properties table
   Then I should see content "Property Detail"
   And I should see content "Meter"
   When I fill in "Reading" with "120.125"
   And I click "Save"
   Then I should see "Reading" field as "120.125"
   And I should see content "Meter reading update successful"
   