require 'spec_helper'

describe AdgroupsController do

  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all adgroups as @adgroups" do
      adgroup = Adgroup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:adgroups).should eq([adgroup])
    end
  end

  describe "GET show" do
    it "assigns the requested adgroup as @adgroup" do
      adgroup = Adgroup.create! valid_attributes
      get :show, {:id => adgroup.to_param}, valid_session
      assigns(:adgroup).should eq(adgroup)
    end
  end

  describe "GET new" do
    it "assigns a new adgroup as @adgroup" do
      get :new, {}, valid_session
      assigns(:adgroup).should be_a_new(Adgroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested adgroup as @adgroup" do
      adgroup = Adgroup.create! valid_attributes
      get :edit, {:id => adgroup.to_param}, valid_session
      assigns(:adgroup).should eq(adgroup)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Adgroup" do
        expect {
          post :create, {:adgroup => valid_attributes}, valid_session
        }.to change(Adgroup, :count).by(1)
      end

      it "assigns a newly created adgroup as @adgroup" do
        post :create, {:adgroup => valid_attributes}, valid_session
        assigns(:adgroup).should be_a(Adgroup)
        assigns(:adgroup).should be_persisted
      end

      it "redirects to the created adgroup" do
        post :create, {:adgroup => valid_attributes}, valid_session
        response.should redirect_to(Adgroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved adgroup as @adgroup" do
        # Trigger the behavior that occurs when invalid params are submitted
        Adgroup.any_instance.stub(:save).and_return(false)
        post :create, {:adgroup => {}}, valid_session
        assigns(:adgroup).should be_a_new(Adgroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Adgroup.any_instance.stub(:save).and_return(false)
        post :create, {:adgroup => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested adgroup" do
        adgroup = Adgroup.create! valid_attributes
        # Assuming there are no other adgroups in the database, this
        # specifies that the Adgroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Adgroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => adgroup.to_param, :adgroup => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested adgroup as @adgroup" do
        adgroup = Adgroup.create! valid_attributes
        put :update, {:id => adgroup.to_param, :adgroup => valid_attributes}, valid_session
        assigns(:adgroup).should eq(adgroup)
      end

      it "redirects to the adgroup" do
        adgroup = Adgroup.create! valid_attributes
        put :update, {:id => adgroup.to_param, :adgroup => valid_attributes}, valid_session
        response.should redirect_to(adgroup)
      end
    end

    describe "with invalid params" do
      it "assigns the adgroup as @adgroup" do
        adgroup = Adgroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Adgroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => adgroup.to_param, :adgroup => {}}, valid_session
        assigns(:adgroup).should eq(adgroup)
      end

      it "re-renders the 'edit' template" do
        adgroup = Adgroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Adgroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => adgroup.to_param, :adgroup => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested adgroup" do
      adgroup = Adgroup.create! valid_attributes
      expect {
        delete :destroy, {:id => adgroup.to_param}, valid_session
      }.to change(Adgroup, :count).by(-1)
    end

    it "redirects to the adgroups list" do
      adgroup = Adgroup.create! valid_attributes
      delete :destroy, {:id => adgroup.to_param}, valid_session
      response.should redirect_to(adgroups_url)
    end
  end

end
