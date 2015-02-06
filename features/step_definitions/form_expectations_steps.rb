Then(/^a new "(.+)" is created$/) do |arg|
  expect(arg.classify.constantize.count).to be > 0
end

Then(/^(\d+) hour[s]? of "(.*?)" counselling is displayed$/) do |arg1, arg2|
  @zone = arg2
  within_fieldset(@zone) do
    find(:xpath, 'ul/li[2]').text.should include("#{arg1.to_f} hours")
  end
end

Then(/^the supervision is "(.*?)"$/) do |arg1|
  within_fieldset(@zone) do
    find(:xpath, 'ul/li[3]').text.should end_with(arg1)
  end
end

Then(/^the "(.*?)" page is displayed$/) do |arg1|
  find('.page_title').text.should eq(arg1)
end
