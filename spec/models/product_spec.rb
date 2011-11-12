require 'spec_helper'

describe Product, "Product Methods" do 
  #let(:product) { Product.new}
  
  it "Title should be blah" do 
    product = Product.new(:title => "Blah", :body => "lip sum dum", :image => "test.jpg", :period => "1900", :country => "USA")
    product.title.should == "Blah"
  end
  it "should set inital number to 1000" do 
    p = Product.first
    p.item_number.should == 1000
  end
  
  
  # it "should set inital number to 1000" do 
  #   product = Product.create!
  #   product.item_number.should == 1000
  # end
  
end