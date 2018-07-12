Then("I should see custom input group field {string} as {string}") do |field_name, field_value| 
  field = page.find(:css, 'span.input-group-text', :text => field_name)
  parent_field = field.find(:xpath, '../..')
  expect(parent_field).to have_xpath("//input[@value='#{field_value}']")
end