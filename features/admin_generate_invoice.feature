Feature: Invoicing a customer

   As an Admin
   I want to be able to invoice a customer
   So that I we can make money for the company

   Scenario: Admin invoicing a customer
   Given I am logged in as "admin"
   Then I should see content "Customers"
   When I click "Customers" link
   Then I should see "Customers" table
   When I click "Manage" on the first row of "Customer" table
   Then I should see content "Customer Management"
   And I should see "Invoice" table
   When I click "Generate Invoice"
   Then I should see a new invoice generated with today's date
