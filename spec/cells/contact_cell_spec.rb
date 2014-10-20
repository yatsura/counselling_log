require 'spec_helper'

describe ContactCell do
  class SupervisionTimeMock
    def self.from_minutes(args)
      "test"
    end
  end

  class QueryObjectMock
    def total_time(args)
      600
    end

    def unsupervised_contact_time(args)
      360
    end
  end

  context "cell rendering" do
    subject { render_cell(:contact, :show, :zone => "Adult", :supervision_time => SupervisionTimeMock, :query_object => QueryObjectMock) }

    it { should have_selector("span#total-time", :text => QueryObjectMock.new.total_time(nil)/60) }
    it { should have_selector("span#unsupervised-contact-time", :text => QueryObjectMock.new.unsupervised_contact_time(nil)/60) }
    it { should have_selector("span#supervision-message", :text => SupervisionTimeMock.from_minutes(nil)) }

    context "rendering adult time" do
      it { should have_selector("legend", :text => "Adult") }
    end

    context "rendering child time" do
      subject { render_cell(:contact, :show, :zone => "Child", :supervision_time => SupervisionTimeMock, :query_object => QueryObjectMock) }

      it { should have_selector("legend", :text => "Child") }
    end
  end

end
