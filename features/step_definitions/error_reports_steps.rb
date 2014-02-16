Then(/^an error message is displayed$/) do
  expect(page).to have_css("div#error_explanation")
end
