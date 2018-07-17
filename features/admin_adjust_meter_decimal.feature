Feature: Admin adjusting meter decimal places

   As an Admin
   I want to be able to adjust the decimal places of a meter
   So that I can match the meter display to that of the physical meter

   Scenario: Admin increase the decimal places of a meter.
   Given I am logged in as "admin"
   When I click "Properties" link
   And I click "View" in the first row of the properties table
   Then I should see content "Meter Reading"
   And I should see custom input group field "Decimals" as "2"
   When I click "+"
   Then I should see custom input group field "Decimals" as "3"
   And I should see content "Meter update successful"

  Scenario: Admin decrease the decimal places of a meter.
   Given I am logged in as "admin"
   When I click "Properties" link
   And I click "View" in the first row of the properties table
   Then I should see content "Meter Reading"
   And I should see custom input group field "Decimals" as "2"
   When I click "-"
   Then I should see custom input group field "Decimals" as "1"
   And I should see content "Meter update successful"