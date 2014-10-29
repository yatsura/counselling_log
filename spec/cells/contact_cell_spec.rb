require 'spec_helper'

describe ContactCell do
  class SupervisionDistantMock
    def self.from_minutes(args)
      Class.new do
        def html_class
          "distant"
        end

        def glyphicon
          "glyphicon-ok-sign"
        end
      end.new
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
    subject { render_cell(:contact, :show, :zone => "Child", :supervision_time => SupervisionDistantMock, :query_object => QueryObjectMock) }

    it { is_expected.to have_selector("span.glyphicon-ok-sign") }
    it { is_expected.to have_selector("a.distant") }

    it { is_expected.to have_selector(".dropdown-information", :text => "Total: 10 hours") }
    it { is_expected.to have_selector(".dropdown-information", :text => "UCT: 6 hours") }

    context "rendering adult time" do
      subject { render_cell(:contact, :show, :zone => "Adult", :supervision_time => SupervisionDistantMock, :query_object => QueryObjectMock) }

      it { is_expected.to have_selector("a", :text => "Adult") }
    end

    context "rendering child time" do
      subject { render_cell(:contact, :show, :zone => "Child", :supervision_time => SupervisionDistantMock, :query_object => QueryObjectMock) }

      it { is_expected.to have_selector("a", :text => "Child") }
    end
  end
end
