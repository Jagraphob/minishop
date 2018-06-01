Given("I am at Minishop home page") do
  visit root_path
end

When("I click {string} link") do |string|
  click_link(string)
end

Then("I should be redirected to {string} page") do |string|
  expect(page).to have_title("Minishop | " + string)
end