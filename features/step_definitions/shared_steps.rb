Given("I am at {string} page") do |string|
  visit(string)
end

When("I click {string} link") do |string|
  click_link(string)
end

Then("I should be redirected to {string} page") do |string|
  expect(page).to have_content(string)
end