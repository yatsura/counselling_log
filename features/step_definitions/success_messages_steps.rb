Then(/^the "(.+)" is updated$/) do |arg1| 
  expect(page).to have_content("#{arg1.capitalize} has been updated")
end

Then(/^the "(.+)" is disabled$/) do |arg1|
  expect(arg1.classify.constantize.count).to eq(0)
  expect(arg1.classify.constantize.unscoped.count).to eq(1)
  expect(page).to have_content("#{arg1.classify.constantize.model_name.human} has been deleted!")
end

Then(/^the "(.+)" is deleted$/) do |arg1|
  expect(arg1.classify.constantize.count).to eq(0)
  expect(page).to have_content("#{arg1.classify.constantize.model_name.human} has been deleted!")
end
