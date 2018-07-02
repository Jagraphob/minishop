Given("I am at Minishop home page") do
  visit root_path
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

Then("I should be redirected to {string} main page") do |string|
  expect(page).to have_title("Minishop | " + string)
end

Then("I should see content {string}") do |string|
  expect(page).to have_content(string)
end

Then("I should see field {string}") do |string|
  expect(page).to find_field(string).value
end
