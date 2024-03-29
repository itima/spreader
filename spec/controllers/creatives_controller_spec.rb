require 'spec_helper'

describe CreativesController do

  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all creatives as @creatives" do
      creative = Creative.create! valid_attributes
      get :index, {}, valid_session
      assigns(:creatives).should eq([creative])
    end
  end

  describe "GET show" do
    it "assigns the requested creative as @creative" do
      creative = Creative.create! valid_attributes
      get :show, {:id => creative.to_param}, valid_session
      assigns(:creative).should eq(creative)
    end
  end

  describe "GET new" do
    it "assigns a new creative as @creative" do
      get :new, {}, valid_session
      assigns(:creative).should be_a_new(Creative)
    end
  end

  describe "GET edit" do
    it "assigns the requested creative as @creative" do
      creative = Creative.create! valid_attributes
      get :edit, {:id => creative.to_param}, valid_session
      assigns(:creative).should eq(creative)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Creative" do
        expect {
          post :create, {:creative => valid_attributes}, valid_session
        }.to change(Creative, :count).by(1)
      end

      it "assigns a newly created creative as @creative" do
        post :create, {:creative => valid_attributes}, valid_session
        assigns(:creative).should be_a(Creative)
        assigns(:creative).should be_persisted
      end

      it "redirects to the created creative" do
        post :create, {:creative => valid_attributes}, valid_session
        response.should redirect_to(Creative.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved creative as @creative" do
        # Trigger the behavior that occurs when invalid params are submitted
        Creative.any_instance.stub(:save).and_return(false)
        post :create, {:creative => {}}, valid_session
        assigns(:creative).should be_a_new(Creative)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Creative.any_instance.stub(:save).and_return(false)
        post :create, {:creative => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested creative" do
        creative = Creative.create! valid_attributes
        # Assuming there are no other creatives in the database, this
        # specifies that the Creative created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Creative.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => creative.to_param, :creative => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested creative as @creative" do
        creative = Creative.create! valid_attributes
        put :update, {:id => creative.to_param, :creative => valid_attributes}, valid_session
        assigns(:creative).should eq(creative)
      end

      it "redirects to the creative" do
        creative = Creative.create! valid_attributes
        put :update, {:id => creative.to_param, :creative => valid_attributes}, valid_session
        response.should redirect_to(creative)
      end
    end

    describe "with invalid params" do
      it "assigns the creative as @creative" do
        creative = Creative.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Creative.any_instance.stub(:save).and_return(false)
        put :update, {:id => creative.to_param, :creative => {}}, valid_session
        assigns(:creative).should eq(creative)
      end

      it "re-renders the 'edit' template" do
        creative = Creative.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Creative.any_instance.stub(:save).and_return(false)
        put :update, {:id => creative.to_param, :creative => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested creative" do
      creative = Creative.create! valid_attributes
      expect {
        delete :destroy, {:id => creative.to_param}, valid_session
      }.to change(Creative, :count).by(-1)
    end

    it "redirects to the creatives list" do
      creative = Creative.create! valid_attributes
      delete :destroy, {:id => creative.to_param}, valid_session
      response.should redirect_to(creatives_url)
    end
  end

end
