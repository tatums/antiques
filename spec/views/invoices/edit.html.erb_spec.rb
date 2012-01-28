require 'spec_helper'

describe "invoices/edit.html.erb" do
  before(:each) do
    @invoice = assign(:invoice, stub_model(Invoice,
      :title => "MyString",
      :subtotal => "9.99",
      :grand_total => "9.99",
      :tax => "9.99",
      :subscriber_id => 1
    ))
  end

  it "renders the edit invoice form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => invoices_path(@invoice), :method => "post" do
      assert_select "input#invoice_title", :name => "invoice[title]"
      assert_select "input#invoice_subtotal", :name => "invoice[subtotal]"
      assert_select "input#invoice_grand_total", :name => "invoice[grand_total]"
      assert_select "input#invoice_tax", :name => "invoice[tax]"
      assert_select "input#invoice_subscriber_id", :name => "invoice[subscriber_id]"
    end
  end
end
