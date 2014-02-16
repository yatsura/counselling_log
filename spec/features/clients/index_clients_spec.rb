require 'spec_helper'

describe "Client list" do
  before :each do
    FactoryGirl.create :organisation
    @client = FactoryGirl.create :client_adult_male
  end

  it "edits a client" do
    visit clients_path

    click_link 'Edit'
    expect(page).to have_content 'Edit Client'
  end

  it "can make a new client" do
    visit clients_path

    click_link 'New'
    expect(page).to have_content 'New Client'
  end

  it "lists the client sessions" do
    visit clients_path

    click_link 'Sessions'
    expect(page).to have_content 'Client Sessions'
    expect(page).to have_content @client.code
  end
end
