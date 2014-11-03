require 'spec_helper'

RSpec.describe "clients/_form.html.haml" do
  before do
    @client = FactoryGirl.build :client
    allow(view).to receive(:org_list).and_return([['Acme', '1'],['Bcme', '2']])
    assign(:client, @client)

    render
  end

  it "zone select contains adult and child" do
    expect(rendered).to have_select("Adult/Child", :options => ['Adult', 'Child'])
  end

  it "Organisation contains Acme and Bcme" do
    expect(rendered).to have_select("Organisation", :options => ['Acme', 'Bcme'])
  end

  it "zone select contains adult and child" do
    expect(rendered).to have_select("Adult/Child", :options => ['Adult', 'Child'])
  end

  it "Organisation contains Acme and Bcme" do
    expect(rendered).to have_select("Organisation", :selected => ['Acme'])
  end
end
