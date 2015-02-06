require 'spec_helper'

RSpec.describe "clients/_form.html.haml" do
  include Formtastic::Helpers::FormHelper
  before do
    @client = FactoryGirl.build :client
    allow(view).to receive(:org_list).and_return([['Acme', '1'],['Bcme', '2']])
    assign(:client, @client)
    semantic_form_for(@client) do |builder|
      allow(view).to receive(:f).and_return(builder)
      render
    end
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
