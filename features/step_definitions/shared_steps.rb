Given("I am at Minishop home page") do
  visit root_path
end

Given("I am logged in as {string}") do |string|
  visit root_path
  click_link('Login')
  fill_in('Email', :with => string == 'admin' ? 'toh@fluxfederation.com' : 'bow@gmail.com')
  click_button('Log In')
end

When("I click {string} link") do |string|
  click_link(string)
end

When("I click {string}") do |string|
  click_button(string)
end

When("I fill in {string} with {string}") do |string1, string2|
  fill_in(string1, :with => string2)
end

When("I click {string} in the first row of the properties table") do |string|
  page.all(:link, string)[0].click
end

When("I click {string} at {string} input group") do |string1, string2|
  input_group = page.find(:css, 'label.input-group-text-label', :text => string2 )
  input_group_parent = input_group.find(:xpath, '..').find(:xpath, '..')
  input_group_parent.click_button(string1)
end

Then("I should be redirected to {string} main page") do |string|
  expect(page).to have_title("Minishop | " + string)
end

Then("I should see content {string}") do |string|
  expect(page).to have_content(string)
end

Then("I should see field {string}") do |string|
  expect(page).to find_field(string).value
end

Then("I should see {string} field as {string}") do |name, field_value| 
  expect(find_field(name).value).to eq field_value
end

Then ("I should see {string} breadcrumb") do |string|
  bc = page.find(:css, 'ol.breadcrumb')
  expect(bc).to have_css('li.breadcrumb-item', text: string)
end
