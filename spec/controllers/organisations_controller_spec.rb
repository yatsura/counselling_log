require 'spec_helper'

describe OrganisationsController do
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

    it "assigns a new record to @organisation" do
      get :new
      expect(assigns(:organisation)).to be_a_new_record
    end
  end

  describe "POST #create" do
    context "with valid data" do
      it "creates a new record" do
        expect {
          post :create, :organisation => FactoryGirl.attributes_for(:organisation)
        }.to change(Organisation, :count)
      end
    end

    context "with invalid data" do
      it "does not create a new record" do
        expect {
          post :create, :organisation => FactoryGirl.attributes_for(:organisation, :name => nil)
        }.not_to change(Organisation, :count)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @organisation = FactoryGirl.create :organisation
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, :id => @organisation.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders with edit template" do
      get :edit, :id => @organisation.id
      expect(response).to render_template("edit")
    end

    it "assigns the record to organisation" do
      get :edit, :id => @organisation.id
      expect(assigns(:organisation)).to be_a(Organisation)
    end
  end

  describe "PUT #update" do
    context "with valid data" do
      before(:each) do
        @organisation = FactoryGirl.create :organisation
        @organisation.name = "ACME0013"
      end

      it "updates the record record" do
        put :update, :id => @organisation, :organisation => accessible_attributes(@organisation)
        expect(Organisation.first.name).to eq(@organisation.name)
      end
    end

    context "with invalid data" do
      before(:each) do
        @organisation = FactoryGirl.create :organisation
        @organisation.name = ""
      end

      it "does not change the label field" do
        expect {
          put :update, :id => @organisation, :organisation => accessible_attributes(@organisation)
        }.not_to change(Organisation.first, :name)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @organisation = FactoryGirl.create :organisation
    end

    it "deletes the record" do
      expect {
        delete :destroy, :id => @organisation.id
      }.to change(Organisation, :count)
    end
  end
end
