require 'spec_helper'
describe User do

  before do
    @user = Fabricate :user
  end

  it "can be instantiated" do
    User.new.should be_an_instance_of(User)
  end

  it "login should work" do
    User.authenticate(@user.email,@user.password).should == @user
  end

  it "login should fail" do
    User.authenticate('test@test_user.com','wrong_password').should be_nil
  end

end
