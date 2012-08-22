require 'spec_helper'
describe Invoice do

  before do
    #@contact= Fabricate :contact
    @invoice = Fabricate :invoice
  end

  it "can be instantiated" do
    Invoice.new.should be_an_instance_of(Invoice)
  end

  it "should respond to title" do
    @invoice.should respond_to :title
  end

  it "has_many line_items" do
    @invoice.line_items.should be_kind_of Array
  end

  it "belongs_to a contact" do
    @invoice.contact.should be_kind_of Contact
  end

  it "Inv Date should be nil" do
    @invoice.inv_date.should_not be_nil
  end

end