Then(/^the (.+) is updated$/) do |arg1| 
  expect(page).to have_content("#{arg1.capitalize} Has Been Updated!")
end

Then(/^the (.+) is deleted$/) do |arg1| 
  expect(arg1.classify.constantize.count).to eq(0)
  expect(page).to have_content("#{arg1.capitalize} Has Been Deleted!")
end

Then(/^the session is delete$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the session is updated$/) do
  pending # express the regexp above with the code you wish you had
end
