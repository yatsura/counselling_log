Given(/^the following setup:$/) do |table|
  table.rows.each do |row| 
    o = FactoryGirl.create :organisation, :name => row[0]
    c = FactoryGirl.create :client, :code => row[1], :zone => row[2], :organisation => o
    FactoryGirl.create_list :counselling_session, row[3].to_i, :client => c
  end
end
