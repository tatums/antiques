require 'spec_helper'

describe "Products" do
  it "Shows all products" do
    get products_path
    response.status.should be(200)
  end
end
