Feature: Admin approve a new customer signup request with his/her properties

  As an administrator
  I want to be able to view customer signup data
  So that I can review and approve or decline the signups

  Scenario: Admin Approve the most recent request
  Given I am logged in as "admin"
  When I click "Properties" link
  Then I should see "Properties" breadcrumb
  When I click "Pending" link
  And I click "View" in the first row of the properties table
  Then I should see "Property" breadcrumb
  And I should see content "Customers"
  And I should see Customer table with one of rows has a status Pending
  When I click Active status button where Pending status was active
  Then I should see the Active button becomes active as in green color

