require 'spec_helper'

describe "New Client" do
  before :each do
    FactoryGirl.create :organisation
  end

  it "save a valid client" do
    visit new_client_path

    fill_in 'Code', :with => 'ABC123'
    select 'Adult', :from => 'Zone'
    select 'ACME', :from => 'Organisation'
    
    click_button 'Create'
    expect(page).to have_content 'Client Has Been Created!'
  end

  it "displays an error message on invalid client details" do
    visit new_client_path

    fill_in 'Code', :with => ''
    select 'Adult', :from => 'Zone'
    select 'ACME', :from => 'Organisation'

    click_button 'Create'
    page.should have_css("div#error_explanation")
  end
end
