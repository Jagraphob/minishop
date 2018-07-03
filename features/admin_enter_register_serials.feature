Feature: Admin enter register serials on a new signed up property

  As an administrator
  I want to be able to enter a property's register serials
  So that I can accurately verify the information of property address and ICP number

  Scenario: Admin enter a register serial for a recently signed up property
  Given I am logged in as "admin"
  When I click "Properties" link
  Then I should see "Properties" breadcrumb
  When I click "Pending" link
  And I click "View" in the first row of the properties table
  Then I should see "Property" breadcrumb
  And I should see content "Register Serials"
  When I fill in "Meter number" with "123"
  And I fill in "Register number" with "02"
  And I fill in "Register decimals" with "0"
  And I click "Add"
  Then I should see 123:02[0] as a row the Register Serial table
  