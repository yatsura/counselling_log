require 'spec_helper'

describe ContactCell do

  context "cell instance" do
    subject { cell(:contact) }

    it { should respond_to(:show) }
  end

  context "cell rendering" do
    context "rendering show" do
      subject { render_cell(:contact, :show) }

      it { should have_selector("h1", :text => "Contact#show") }
      it { should have_selector("p", :text => "Find me in app/cells/contact/show.html") }
    end
  end

end
