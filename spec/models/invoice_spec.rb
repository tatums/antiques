require 'spec_helper'
describe Invoice do

  before do
    @invoice = Fabricate :invoice
  end

  it "can be instantiated" do
    Invoice.new.should be_an_instance_of(Invoice)
  end

  it "Inv Date should be nil" do
    @invoice.inv_date.should_not be_nil
  end

end