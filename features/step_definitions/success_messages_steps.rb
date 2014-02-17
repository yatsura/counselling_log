Then(/^the client is updated$/) do
  expect(page).to have_content('Client Has Been Updated!')
end

Then(/^the client is deleted$/) do
  expect(Client.count).to eq(0)
  expect(page).to have_content('Client Has Been Deleted!')
end
