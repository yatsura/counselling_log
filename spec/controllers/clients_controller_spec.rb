require 'spec_helper'

describe ClientsController, :type => :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders with new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns a new record to @client" do
      get :new
      expect(assigns(:client)).to be_a_new_record
    end
  end

  describe "GET #new within an organisation" do
    it "assigns the @organisation" do
      org = FactoryGirl.create :organisation
      get :new, :organisation_id => org.id
      expect(assigns(:organisation)).to eq(org)
    end
  end
  describe "POST #create" do
    context "with valid data" do
      it "creates a new record" do
        expect {
          post :create, :client => FactoryGirl.attributes_for(:client)
        }.to change(Client, :count)
      end
    end

    context "with invalid data" do
      it "does not create a new record" do
        expect {
          post :create, :client => FactoryGirl.attributes_for(:client, :zone => nil)
        }.not_to change(Client, :count)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @client = FactoryGirl.create :client
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, :id => @client.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders with edit template" do
      get :edit, :id => @client.id
      expect(response).to render_template("edit")
    end

    it "assigns the record to client" do
      get :edit, :id => @client.id
      expect(assigns(:client)).to be_a(Client)
    end
  end

  describe "PUT #update" do
    context "with valid data" do
      before(:each) do
        @client = FactoryGirl.create :client
        @client.code = "ACME0013"
      end

      it "updates the record record" do
        put :update, :id => @client, :client => accessible_attributes(@client)
        expect(Client.first.code).to eq(@client.code)
      end
    end

    context "with invalid data" do
      before(:each) do
        @client = FactoryGirl.create :client
        @client.code = ""
      end

      it "does not change the label field" do
        expect {
          put :update, :id => @client, :client => accessible_attributes(@client)
        }.not_to change(Client.first, :code)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @client = FactoryGirl.create :client
    end

    it "deletes the record" do
      expect {
        delete :destroy, :id => @client.id
      }.to change(Client, :count)
    end
  end
end
