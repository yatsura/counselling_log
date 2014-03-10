require 'spec_helper'

describe Vo::CoscaAdultSupervisionTime do
  it "6 hours sessions are distant" do
    expect(Vo::CoscaAdultSupervisionTime.from_minutes(6*60)).to eq(Vo::CoscaAdultSupervisionTime.new "Distant")
  end

  it "10 hours sessions are close" do
    expect(Vo::CoscaAdultSupervisionTime.from_minutes(10*60)).to eq(Vo::CoscaAdultSupervisionTime.new "Close")
  end

  it "12 hours sessions are close" do
    expect(Vo::CoscaAdultSupervisionTime.from_minutes(12*60)).to eq(Vo::CoscaAdultSupervisionTime.new "Due")
  end

  it "13 hours sessions are close" do
    expect(Vo::CoscaAdultSupervisionTime.from_minutes(13*60)).to eq(Vo::CoscaAdultSupervisionTime.new "Over Due")
  end
  
end
