require 'spec_helper'

describe ContactGroup do
  it "can be instantiated" do
    ContactGroup.new.should be_an_instance_of(ContactGroup)
  end
end
