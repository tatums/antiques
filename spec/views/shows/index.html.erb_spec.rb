require 'spec_helper'

describe "shows/index.html.erb" do
  before(:each) do
    assign(:shows, [
      stub_model(Show,
        :title => "Title",
        :url => "Url",
        :dates => "Dates"
      ),
      stub_model(Show,
        :title => "Title",
        :url => "Url",
        :dates => "Dates"
      )
    ])
  end

  it "renders a list of shows" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dates".to_s, :count => 2
  end
end
