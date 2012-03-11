describe "A User (in general)" do
  include UserSpecHelper

  before(:each) do
    @user = User.new
  end

  it "should be invalid without a username" do
    @user.attributes = valid_user_attributes.except(:email)
    # @user.should_not be_valid
    # @user.should have(1).error_on(:email)
    # @user.errors.on(:email).should == "is required"
    # @user.email = "someusername"
    @user.should_not be_valid
  end
end
