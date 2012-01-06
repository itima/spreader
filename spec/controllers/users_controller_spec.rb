require 'spec_helper'

describe UsersController do
  before do 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
    @user = Factory(:user)
    set_session_for(@user)
  end
  
  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end

  describe "GET 'show'" do
    it "assigns the requested user as @user" do
        get :show, {:id => @user.to_param}
        assigns(:user).should eq(@user)
    end
  end

end
