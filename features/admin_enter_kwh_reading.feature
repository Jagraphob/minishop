Feature: Admin entering index kWh readings to the meter of a property

   As an admin
   I want to be able to enter the kWh readings for the meter of a property
   So that I can update how much each property has used the electricity and keep the system up to date with the properties meter.

   Scenario: Admin entering a kWh reading on one of the properties
   Given I am logged in as "admin"
   When I click "Properties" link
   Then I should see "Properties" breadcrumb
   When I click "View" in the first row of the properties table
   Then I should see content "Meter Reading"
   When I fill in "Reading" with "1500.35"
   And I click "Save" at "Reading" input group 
   Then I should see "Reading" field as "1500.35"

   

