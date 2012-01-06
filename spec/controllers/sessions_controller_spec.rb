require 'spec_helper'

describe SessionsController do 
  before(:each) do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end
  
  it 'should allow login' do 
    get :create, :provider => 'facebook' 
    Rails.logger.debug { "SESSION: #{session[:user_id]}" }
    assigns(:user).should_not be_nil 
  end 
end 