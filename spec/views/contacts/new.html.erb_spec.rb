require 'spec_helper'

describe "contacts/new.html.erb" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :name => "MyString",
      :address => "",
      :city => "MyString",
      :zip => "MyString",
      :email => "MyString",
      :comments => "MyText"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_name", :name => "contact[name]"
      assert_select "input#contact_address", :name => "contact[address]"
      assert_select "input#contact_city", :name => "contact[city]"
      assert_select "input#contact_zip", :name => "contact[zip]"
      assert_select "input#contact_email", :name => "contact[email]"
      assert_select "textarea#contact_comments", :name => "contact[comments]"
    end
  end
end
