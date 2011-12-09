require 'spec_helper'

describe "subscribers/edit.html.erb" do
  before(:each) do
    @subscriber = assign(:subscriber, stub_model(Subscriber,
      :first => "MyString",
      :last => "MyString",
      :email => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit subscriber form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscribers_path(@subscriber), :method => "post" do
      assert_select "input#subscriber_first", :name => "subscriber[first]"
      assert_select "input#subscriber_last", :name => "subscriber[last]"
      assert_select "input#subscriber_email", :name => "subscriber[email]"
      assert_select "input#subscriber_address", :name => "subscriber[address]"
      assert_select "input#subscriber_city", :name => "subscriber[city]"
      assert_select "input#subscriber_state", :name => "subscriber[state]"
      assert_select "input#subscriber_zip", :name => "subscriber[zip]"
    end
  end
end
