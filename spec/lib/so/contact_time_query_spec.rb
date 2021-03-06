require 'spec_helper'

describe So::ContactTimeQuery do
  context '10 hours' do
    context 'adult contact' do
      before(:each) do
        adult = FactoryGirl.create :client, :adult
        1.upto(10).each do |i|
          FactoryGirl.create :counselling_session, :adult, :hour_long, :date => i.weeks.ago, :meetable => adult
        end
      end
      
      it "600 minutes total_adult_time" do
        expect(subject.total_adult_time).to eq(600)
      end

      it "0 minutes total_child_time" do
        expect(subject.total_child_time).to eq(0)
      end

      it "600 minutes unsupervised_contact_time" do
        expect(subject.unsupervised_contact_time("Adult")).to eq(600)
      end
    end
    context 'child contact' do
      before(:each) do
        child = FactoryGirl.create :client, :child
        1.upto(10).each do |i|
          FactoryGirl.create :counselling_session, :child, :hour_long, :date => i.weeks.ago, :meetable => child
        end
      end
      
      it "0 minutes total_adult_time" do
        expect(subject.total_adult_time).to eq(0)
      end

      it "600 minutes total_child_time" do
        expect(subject.total_child_time).to eq(600)
      end

      it "600 minutes unsupervised_contact_time" do
        expect(subject.unsupervised_contact_time("Child")).to eq(600)
      end

    end
    context 'with supervision 3 weeks ago' do
      before(:each) do
        adult = FactoryGirl.create :client, :adult
        1.upto(10).each do |i|
          FactoryGirl.create :counselling_session, :adult, :hour_long, :date => i.weeks.ago, :meetable => adult
        end

        supervisor = FactoryGirl.create :supervisor
        FactoryGirl.create :counselling_session, :adult, :hour_long, :date => 3.weeks.ago, :meetable => supervisor
      end

      it "120 minutes unsupervised_contact_time" do
        expect(subject.unsupervised_contact_time("Adult")).to eq(120)
      end
    end
  end
end
