require 'spec_helper'

describe "shows/new.html.erb" do
  before(:each) do
    assign(:show, stub_model(Show,
      :title => "MyString",
      :url => "MyString",
      :dates => "MyString"
    ).as_new_record)
  end

  it "renders new show form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shows_path, :method => "post" do
      assert_select "input#show_title", :name => "show[title]"
      assert_select "input#show_url", :name => "show[url]"
      assert_select "input#show_dates", :name => "show[dates]"
    end
  end
end
