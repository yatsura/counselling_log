require 'spec_helper'

describe Client, :type => :model do
  before(:each) do
    @organisation = FactoryGirl.create :organisation
    FactoryGirl.create_list :client, 5, :female, :adult
    FactoryGirl.create_list :client, 3, :female, :adult, :invisible
  end

  it "by default lists visible clients" do
    expect(Client.all.count).to eq(5)
  end
end
