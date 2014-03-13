require 'spec_helper'

describe So::ContactTimeQuery do
  context '10 hours of adult contact time' do
    before(:each) do
      adult = FactoryGirl.create :client, :adult
      1.upto(10).each do |i|
          FactoryGirl.create :counselling_session, :adult, :hour_long, :date => i.weeks.ago, :meetable => adult
      end
    end
      
    it "600 minutes total_adult_time" do
      expect(So::ContactTimeQuery.new(nil).total_adult_time).to eq(600)
    end

    it "0 minutes total_child_time" do
      expect(So::ContactTimeQuery.new(nil).total_child_time).to eq(0)
    end

    it "600 minutes unsupervised_contact_time" do
      expect(So::ContactTimeQuery.new(nil).unsupervised_contact_time("Adult")).to eq(600)
    end
  end
end
