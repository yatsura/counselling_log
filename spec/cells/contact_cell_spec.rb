require 'spec_helper'

describe ContactCell do
  before(:each) do
    @classVo = class_double(Vo::CoscaAdultSupervisionTime)
    cast_inst = instance_double(Vo::CoscaAdultSupervisionTime)
    @queryObject = instance_double(So::ContactTimeQuery)
    allow(@queryObject).to receive(:total_time) { 600 }
    allow(@queryObject).to receive(:unsupervised_contact_time) { 360 }
    allow(cast_inst).to receive(:html_class) { "distant" }
    allow(cast_inst).to receive(:glyphicon) { "glyphicon-ok-sign" }
    allow(@classVo).to receive(:from_minutes) { cast_inst }
  end

  context "cell rendering" do
    subject { render_cell(:contact, :show, :zone => "Child", :supervision_time => @classVo, :query_object => @queryObject) }

    it { is_expected.to have_selector("span.glyphicon-ok-sign") }
    it { is_expected.to have_selector("a.distant") }

    it { is_expected.to have_selector(".dropdown-information", :text => "Total: 10 hours") }
    it { is_expected.to have_selector(".dropdown-information", :text => "UCT: 6 hours") }

    context "rendering adult time" do
      subject { render_cell(:contact, :show, :zone => "Adult", :supervision_time => @classVo, :query_object => @queryObject) }

      it { is_expected.to have_selector("a", :text => "Adult") }
    end

    context "rendering child time" do
      subject { render_cell(:contact, :show, :zone => "Child", :supervision_time => @classVo, :query_object => @queryObject) }

      it { is_expected.to have_selector("a", :text => "Child") }
    end
  end
end
