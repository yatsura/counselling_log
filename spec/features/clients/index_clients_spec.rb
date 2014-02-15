require 'spec_helper'

describe "Client list" do
  before :each do
    FactoryGirl.create :organisation
    FactoryGirl.create :client_adult_male
  end

  it "edits a client" do
    visit '/clients'

    click_link 'Edit'
    expect(page).to have_content 'Edit Client'
  end

  it "can make a new client" do
    visit '/clients'

    click_link 'New'
    expect(page).to have_content 'New Client'
  end
end
