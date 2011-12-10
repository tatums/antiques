require 'spec_helper'

describe "shows/show.html.erb" do
  before(:each) do
    @show = assign(:show, stub_model(Show,
      :title => "Title",
      :url => "Url",
      :dates => "Dates"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dates/)
  end
end
