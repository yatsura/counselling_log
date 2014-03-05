Given(/^that a organisation exists$/) do
  FactoryGirl.create :organisation
end

Given(/^that a client exists$/) do
  FactoryGirl.create :client
end

Given(/^that the client has had some sessions$/) do
  FactoryGirl.create :counselling_session, client: Client.first
end

Given(/^a session exists$/) do
  FactoryGirl.create :counselling_session, client: Client.first
end

Given(/^that a supervisor exists$/) do
  FactoryGirl.create :supervisor
end
