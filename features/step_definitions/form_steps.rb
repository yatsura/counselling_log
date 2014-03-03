When(/^valid client details are entered$/) do
  fill_in 'Code', :with => 'ABC123'
  select 'Adult', :from => 'Zone'
  select 'ACME', :from => 'Organisation'
end

When(/^invalid client details are entered$/) do
  fill_in 'Code', :with => ''
  select 'Adult', :from => 'Zone'
  select 'ACME', :from => 'Organisation'
end

When(/^valid client details are changed$/) do
  fill_in 'Code', :with => 'XYZ'
end

When(/^the code is incorrect$/) do
  fill_in 'Code', :with => ''''
end

When(/^the "(.+)" button is pressed$/) do |arg1|
  click_button arg1
end

When(/^the "(.+)" link is clicked$/) do |arg1|
  click_link arg1
end

When(/^the first "(.+)" link is clicked$/) do |arg1|
  first("//a[text()='#{arg1}']").click
end
When(/^the page is viewed$/) do

end

Then(/^the "(.+)" page is|are displayed$/) do |arg1|
  expect(find("h1.page_title")).to have_content(arg1)
end

Then(/^a table of "(.*?)" details are visible$/) do |arg1|
  expect(page).to have_css("table.#{arg1.gsub(' ','_')}_grid")
end

When(/^valid session details for the client are entered$/) do
  select 'Adult', :from => 'Zone'
  within 'li#counselling_session_date_input' do
    select '1', :from => 'Day'
    select 'January', :from => 'Month'
    select '2014', :from => 'Year'
    select '09', :from => 'Hour'
    select '45', :from => 'Minute'
  end
end

When(/^valid session details are entered$/) do
  select 'CODE', :from => 'Client'
  select 'Adult', :from => 'Zone'
  within 'li#counselling_session_date_input' do
    select '1', :from => 'Day'
    select 'January', :from => 'Month'
    select '2014', :from => 'Year'
    select '09', :from => 'Hour'
    select '45', :from => 'Minute'
  end
end

When(/^invalid session details are entered$/) do
  fill_in 'Length', :with => ''
end

