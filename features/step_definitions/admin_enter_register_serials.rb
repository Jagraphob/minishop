Then("I should see 123:02[0] as a row the Register Serial table") do
  expect(page).to have_css('td', text: '123:02[0]')
end