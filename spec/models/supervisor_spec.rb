require 'spec_helper'

describe Supervisor do
  before(:each) do
    FactoryGirl.create_list :supervisor, 2, :adult
    FactoryGirl.create :supervisor, :adult, :invisible
  end

  it "by default lists visible supervisors" do
    expect(Supervisor.all.count).to eq(2)
  end

  it "has the same code as the name" do
    s = Supervisor.first
    expect(s.code).to eq(s.name)
  end

end
