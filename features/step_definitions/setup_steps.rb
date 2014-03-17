Given(/^the following setup:$/) do |table|
  table.rows.each do |row| 
    o = FactoryGirl.create :organisation, :name => row[0]
    c = FactoryGirl.create :client, :code => row[1], :zone => row[2], :organisation => o
    FactoryGirl.create_list :counselling_session, row[3].to_i, :meetable => c
  end
end

Given(/^(\d+) hour[s]? of "(.*?)" counselling$/) do |arg1, arg2|
  FactoryGirl.create_list :counselling_session, arg1.to_i, :adult, :hour_long, :meetable => Client.first, :zone => arg2
end
