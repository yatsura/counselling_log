require "spec_helper"

describe "application/index.html.haml" do
  context "client" do
    before do
      assign(:assets, FactoryGirl.build(:client))
      assign(:grid, ClientsGrid.new([]))
      allow(view).to receive(:resource_name).and_return("Client")
    end
    it "has Client as the page_title" do
      render
      expect(rendered).to have_selector("h1.page-title", :text => "Client")
    end
  end

  context "supervisor" do
    before do
      allow(view).to receive(:resource_name).and_return("Supervisor")
    end

    it "has Supervisor as the page_title" do
      render
      expect(rendered).to have_selector("h1.page-title", :text => "Supervisor")
    end
  end


end
