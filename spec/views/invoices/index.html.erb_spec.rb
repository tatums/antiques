require 'spec_helper'

describe "invoices/index.html.erb" do
  before(:each) do
    assign(:invoices, [
      stub_model(Invoice,
        :title => "Title",
        :subtotal => "9.99",
        :grand_total => "9.99",
        :tax => "9.99",
        :subscriber_id => 1
      ),
      stub_model(Invoice,
        :title => "Title",
        :subtotal => "9.99",
        :grand_total => "9.99",
        :tax => "9.99",
        :subscriber_id => 1
      )
    ])
  end

  it "renders a list of invoices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
