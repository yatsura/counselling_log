Then(/^a new "(.+)" is created$/) do |arg|
  arg.classify.constantize.count > 0
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

