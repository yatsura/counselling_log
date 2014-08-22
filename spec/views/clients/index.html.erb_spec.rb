require 'spec_helper'


describe "clients/index.html.erb" do
  before :each do
    @organisation = FactoryGirl.create :organisation
    FactoryGirl.create_list :client_adult_male, 10, :organisation => @organisation
    grid = ClientsGrid.new nil
    assign(:grid, grid)
    assign(:assets, grid.assets.paginate(:page => nil))
  end

  describe 'displays a list of clients, which' do
    it 'contains their code' do
      render
      rendered.should include(Client.first.code)
    end

    it 'contains their zone' do
      render
      rendered.should include(Client.first.zone)
    end

    it 'contains their organisation' do
      render
      rendered.should include(Client.first.organisation.name)
    end

    it 'contains their gender' do
      render
      rendered.should include(Client.first.gender)
    end

    it 'allows viewing of their sessions' do
      render
      rendered.should include(client_counselling_sessions_path(Client.first))
    end

    it 'allows displaying of their details' do
      render
      rendered.should include(client_path(Client.first))
    end
  end

  it "allows creating a new client if we are within an organisation" do
    assign(:organisation, @organisation)
    render
    rendered.should include(new_client_path)
  end
end
