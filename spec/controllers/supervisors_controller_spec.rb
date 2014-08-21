require 'spec_helper'

describe SupervisorsController do
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

    it "assigns a new record to @supervisor" do
      get :new
      expect(assigns(:supervisor)).to be_a_new_record
    end
  end

  describe "POST #create" do
    context "with valid data" do
      it "creates a new record" do
        expect {
          post :create, :supervisor => FactoryGirl.attributes_for(:supervisor)
        }.to change(Supervisor, :count)
      end
    end

    context "with invalid data" do
      it "does not create a new record" do
        expect {
          post :create, :supervisor => FactoryGirl.attributes_for(:supervisor, :zone => nil)
        }.not_to change(Supervisor, :count)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @supervisor = FactoryGirl.create :supervisor
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, :id => @supervisor.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders with edit template" do
      get :edit, :id => @supervisor.id
      expect(response).to render_template("edit")
    end

    it "assigns the record to supervisor" do
      get :edit, :id => @supervisor.id
      expect(assigns(:supervisor)).to be_a(Supervisor)
    end
  end

  describe "PUT #update" do
    context "with valid data" do
      before(:each) do
        @supervisor = FactoryGirl.create :supervisor
        @supervisor.name = "ACME0013"
      end

      it "updates the record record" do
        put :update, :id => @supervisor, :supervisor => accessible_attributes(@supervisor)
        expect(Supervisor.first.name).to eq(@supervisor.name)
      end
    end

    context "with invalid data" do
      before(:each) do
        @supervisor = FactoryGirl.create :supervisor
        @supervisor.name = ""
      end

      it "does not change the label field" do
        expect {
          put :update, :id => @supervisor, :supervisor => accessible_attributes(@supervisor)
        }.not_to change(Supervisor.first, :name)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @supervisor = FactoryGirl.create :supervisor
    end

    it "deletes the record" do
      expect {
        delete :destroy, :id => @supervisor.id
      }.to change(Supervisor, :count)
    end
  end
end
