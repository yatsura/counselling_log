Given(/^there has been "(\d+)" hours of counselling with clients$/) do |arg1|
  hours = arg1.to_i
  FactoryGirl.create_list(:counselling_session, hours, :adult, :with_client, :hour_long)
end

Then(/^with the "(.*?)" cell:$/) do |cell, table|
  within_fieldset(cell) do
    table.raw.each do |row|
      expect(find("##{row[0]}").text).to eq(row[1])
    end
  end
end
