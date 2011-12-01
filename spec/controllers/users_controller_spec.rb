require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'change_password'" do
    it "returns http success" do
      get 'change_password'
      response.should be_success
    end
  end

end
