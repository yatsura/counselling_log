require 'spec_helper'

describe CounsellingSession do
  before(:each) do
    FactoryGirl.create :client
    FactoryGirl.create :supervisor

    dates = (1..4).each do |i| 
      FactoryGirl.create :counselling_session, :meetable => Client.first, :date => i.weeks.ago
      FactoryGirl.create :counselling_session, :meetable => Supervisor.first, :date => i.weeks.ago
    end
  end
  it "provides the last counselling session for a client" do
    expect(CounsellingSession.last_for(Client.first)).to eq(CounsellingSession.first)
  end
  it "provides the last counselling session with a supervisor" do
    expect(CounsellingSession.last_for(Supervisor.first)).to eq(CounsellingSession.all.second)
  end
end
