When(/^valid client details are entered$/) do
  fill_in 'Code', :with => 'ABC123'
  select 'Adult', :from => 'Zone'
  select 'ACME', :from => 'Organisation'
    
  click_button 'Create'
end

When(/^invalid client details are entered$/) do
  fill_in 'Code', :with => ''
  select 'Adult', :from => 'Zone'
  select 'ACME', :from => 'Organisation'

  click_button 'Create'
end
