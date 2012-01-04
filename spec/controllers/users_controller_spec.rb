require 'spec_helper'

describe UsersController do
  before do 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
  end
  
  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end

  describe "GET 'show'" do
    it "assigns the requested user as @user" do
        pending
        # @user = Factory(:user)
        # session[:user_id] = @user.id
        # get :show, {:id => @user.to_param}
        # assigns(:user).should eq(@user)
    end
  end

end
