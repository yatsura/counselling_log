require 'spec_helper'

describe "Edit Client" do
  before :each do
    FactoryGirl.create :organisation
    @client = FactoryGirl.create :client_adult_male
  end

  it "save a valid client" do
    visit edit_client_path(@client)

    fill_in 'Code', :with => 'ABC123'
    select 'Adult', :from => 'Zone'
    select 'ACME', :from => 'Organisation'
    
    click_button 'Update'
    expect(page).to have_content 'Client Has Been Updated!'
  end

  it "displays an error message on invalid client details" do
    visit edit_client_path(@client)

    fill_in 'Code', :with => ''
    select 'Adult', :from => 'Zone'
    select 'ACME', :from => 'Organisation'

    click_button 'Update'
    page.should have_css("div#error_explanation")
  end
end
