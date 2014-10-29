require 'spec_helper'

describe Lookups::Client do
  before(:each) do
    @supervisor   = FactoryGirl.create :supervisor
    @organisation = FactoryGirl.create :organisation
    @c_self       = FactoryGirl.create :client, :self
    @org_clients  = FactoryGirl.create_list(:client, 2, :organisation => @organisation)
    FactoryGirl.create_list(:client, 2, :organisation => (FactoryGirl.create(:organisation)))
  end

  it "list clients within the organisation when parent is an organisation" do
    expect(Lookups::Client.by_parent(@organisation).count).to eq(2)
    expect(Lookups::Client.by_parent(@organisation)).to include([@org_clients.first.code,@org_clients.first.id])

  end

  it "just lists the client when the parent is a client" do
    expect(Lookups::Client.by_parent(Client.first).count).to eq(1)
    expect(Lookups::Client.by_parent(Client.first)).to include([Client.first.code,Client.first.id])
  end

  it "lists client as supervisor when parent is a supervisor" do
    expect(Lookups::Client.by_parent(@supervisor).count).to eq(1)
    expect(Lookups::Client.by_parent(@supervisor)).to include([@supervisor.code,@supervisor.id])
  end

  it "lists all for anything else" do
    expect(Lookups::Client.by_parent(nil).count).to eq(5)
  end

end
