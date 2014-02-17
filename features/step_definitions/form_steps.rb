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

When(/^the page is viewed$/) do

end

Then(/^the "(.+)" page is|are displayed$/) do |arg1|
  expect(find("h1.page_title")).to have_content(arg1)
end

Then(/^a table of client details is|are visible$/) do
  within('table.clients_grid') do
    expect(page).to have_css('td.code')
    expect(page).to have_css('td.zone')
    expect(page).to have_css('td.organisation_name')
    expect(page).to have_css('td.gender')
  end
end
