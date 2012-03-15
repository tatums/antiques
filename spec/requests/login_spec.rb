describe "Login page" do

  before do
    @user = Fabricate :user
  end
  it "Show Login Page" do
    get login_path
    response.status.should be(200)
  end

  it "Should Login" do
    visit login_path
    fill_in "email", :with => @user.email
    fill_in "password", :with => @user.password
    click_button "Login"
    page.should have_content('Logged in!')
  end
end
