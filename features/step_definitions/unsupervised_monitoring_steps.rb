Then(/^with the "(.*?)" cell:$/) do |cell, table|
  within_fieldset(cell) do
    table.raw.each do |row|
      expect(find("##{row[0]}").text).to eq(row[1])
    end
  end
end
