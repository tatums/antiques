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

  it "should be invalid without a email" do
    @user.email = ''
    @user.should_not be_valid
    @user.should have(1).error_on(:email)
  end

  it "should be valid" do
    #@user.save
    @user.should be_valid
  end

end
