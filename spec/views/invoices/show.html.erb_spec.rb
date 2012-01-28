require 'spec_helper'

describe "invoices/show.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :title => "Title",
      :subtotal => "9.99",
      :grand_total => "9.99",
      :tax => "9.99",
      :subscriber_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
