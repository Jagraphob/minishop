Then("I should see Customer table with one of rows has a status Pending") do
  expect(page).to have_css('a.btn-warning', :text => 'Pending')  
end

When("I click Active status button where Pending status was active") do
  pending_button = page.find(:css, 'a.btn-warning', :text => 'Pending')
  button_group = pending_button.find(:xpath, '..')
  button_group.find(:css, 'a', :text => 'Active').click
end

When("I should see the Active button becomes active as in green color") do
  expect(page).to have_css('a.btn-success', :text => 'Active')
end