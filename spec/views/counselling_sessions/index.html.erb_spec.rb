require 'spec_helper'

describe "counselling_sessions/index.html.erb" do
  before :each do
    @client = FactoryGirl.create :client
    FactoryGirl.create_list :counselling_session, 10, :adult, :hour_long, :meetable => @client
    grid = CounsellingSessionsGrid.new nil
    assign(:grid, grid)
    assign(:assets, grid.assets.paginate(:page => nil))
  end

  describe 'displays a list of sessions, which' do
    it 'contains a list of dates' do
      render
      formated_date = I18n.l CounsellingSession.first.date, :scope => 'grid'
      rendered.should have_selector("td.date", :text => formated_date)
    end

    it 'contains the code' do
      render
      rendered.should have_selector("td.with", :text => @client.code)
    end

    it 'contains the length' do
      render
      rendered.should have_selector("td.length", :text => "60.0")
    end
  end
end
