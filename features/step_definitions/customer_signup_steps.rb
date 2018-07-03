Then("I should see 11 Test Street Wellington in the Added Properties table") do
  td = page.find(:css, 'td', text: /^11$/)
  tr = td.find(:xpath, './parent::tr')
  expect(tr).to have_css('td', text: 'Test Street')
  expect(tr).to have_css('td', text: 'Wellington')
end