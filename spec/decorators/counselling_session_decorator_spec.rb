require 'spec_helper'

describe CounsellingSessionDecorator do
  describe "when the model is new and the client_id is nil" do
    subject {CounsellingSession.new.decorate}
    it "creates a client dropdown from the organisation" do
      expect(subject.client_control).to have_selector('select')
    end
  end
  describe "when the model is new and there is a client_id" do
    let(:client) { FactoryGirl.create :client }
    subject { CounsellingSession.new(:meetable => client).decorate}
    it "creates a read-only textbox with the client code", :focus => true do
      expect(subject.client_control).to have_selector('input')
    end
    it "create a selection with the clients type selected by default" do
      skip
    end
  end
  describe "when the model exists" do
    let(:client) {FactoryGirl.create :client}
    let(:counselling_session) {FactoryGirl.create :counselling_session, :meetable => client}
    subject {counselling_session.decorate}
    it "creates a read-only textbox with the client code", :focus => true do
      expect(subject.client_control).to have_selector('input')
    end
  end
end
