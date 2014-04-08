# -*- coding: utf-8 -*-
When(/^valid client details are entered$/) do
  fill_in 'Code', :with => 'ABC123'
  select 'Adult', :from => 'Type'
  select 'ACME', :from => 'Organisation'
end

When(/^invalid client details are entered$/) do
  fill_in 'Code', :with => ''
  select 'Adult', :from => 'Type'
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
  within("div.main_con") do
    click_link arg1
  end
end

When(/^the first "(.+)" link is clicked$/) do |arg1|
  first("//a[text()='#{arg1}']").click
end
When(/^the page is viewed$/) do

end

Then(/^the "(.+)" page [is|are] displayed$/) do |arg1|
  expect(find("h1.page_title")).to have_content(arg1)
end

Then(/^a table of "(.*?)" details are visible$/) do |arg1|
  expect(page).to have_css("table.#{arg1.gsub(' ','_')}_grid")
end

When(/^valid session details for the client are entered$/) do
  select 'Adult', :from => 'Type'
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
  select 'Adult', :from => 'Type'
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

When(/^valid organisation details are entered$/) do
  fill_in 'Name', :with => 'Acme'
  fill_in 'Address', :with => 'Someplace'
  fill_in 'Contact name', :with => 'Joe Doë'
end

When(/^invalid organisation details are entered$/) do
  fill_in 'Address', :with => 'Someplace'
  fill_in 'Contact name', :with => 'Joe Doë'
end

When(/^valid supervisor details are entered$/) do
  fill_in 'Name', :with => 'Jane Doè'
  fill_in 'Cost', :with => '35.00'
  fill_in 'Address', :with => 'Someplace'
  fill_in 'Contact name', :with => 'Jane Doè'
  select 'Adult', :from => 'Type'
  fill_in 'Email', :with => 'a@b'
end

When(/^invalid supervisor details are entered$/) do
  fill_in 'Name', :with => ''
  fill_in 'Cost', :with => '35.00'
  fill_in 'Address', :with => 'Someplace'
  fill_in 'Contact name', :with => 'Jane Doè'
  select 'Adult', :from => 'Type'
  fill_in 'Email', :with => 'a@b'
end

When(/^the "(.+)" is blank$/) do |arg1|
  fill_in arg1, :with => ''
end
