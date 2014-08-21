require 'spec_helper'

describe CounsellingSessionsController do
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

    it "assigns a new record to @counselling_session" do
      get :new
      expect(assigns(:counselling_session)).to be_a_new_record
    end
  end

  describe "POST #create" do
    context "with valid data" do
      it "creates a new record" do
        expect {
          post :create, :counselling_session => FactoryGirl.attributes_for(:counselling_session)
        }.to change(CounsellingSession, :count)
      end
    end

    context "with invalid data" do
      it "does not create a new record" do
        expect {
          post :create, :counselling_session => FactoryGirl.attributes_for(:counselling_session, :zone => nil)
        }.not_to change(CounsellingSession, :count)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @counselling_session = FactoryGirl.create :counselling_session
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, :id => @counselling_session.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders with edit template" do
      get :edit, :id => @counselling_session.id
      expect(response).to render_template("edit")
    end

    it "assigns the record to client" do
      get :edit, :id => @counselling_session.id
      expect(assigns(:counselling_session)).to be_a(CounsellingSession)
    end
  end

  describe "PUT #update" do
    context "with valid data" do
      before(:each) do
        @counselling_session = FactoryGirl.create :counselling_session
        @counselling_session.zone = "extra"
      end

      it "updates the record record" do
        put :update, :id => @counselling_session, :counselling_session => accessible_attributes(@counselling_session)
        expect(CounsellingSession.first.zone).to eq(@counselling_session.zone)
      end
    end

    context "with invalid data" do
      before(:each) do
        @counselling_session = FactoryGirl.create :counselling_session
        @counselling_session.zone = ""
      end

      it "does not change the label field" do
        expect {
          put :update, :id => @counselling_session, :counselling_session => accessible_attributes(@counselling_session)
        }.not_to change(CounsellingSession.first, :zone)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @counselling_session = FactoryGirl.create :counselling_session
    end

    it "deletes the record" do
      expect {
        delete :destroy, :id => @counselling_session.id
      }.to change(CounsellingSession, :count)
    end
  end
end
