class AccountsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = current_user.accounts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    correct_user?
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end


  # GET /accounts/new
  # GET /accounts/new.json
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    correct_user?
    
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.user = current_user
    
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    correct_user?
    
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end
  
  def retrieve
    Rails.logger.debug { "AccountsController#retrieve - #{params['account_id']}" }
    if account = Account.retrieve(params['account_id'], current_user)
      flash[:success] = "Successfuly retrieved data from #{params['account_id']}"
      redirect_to account
    else
      flash[:error] = "Couldn't retrieve data from #{params['account_id']}"
      redirect_to current_user
    end
  end
  
  def sync
    Rails.logger.debug { "AccountsController#sync - #{params['account_id']}" }
    if account = Account.retrieve(params['account_id'], current_user)
      flash[:success] = "Successfuly updated data from #{params['account_id']}"
      redirect_to account
    else
      flash[:error] = "Couldn't retrieve data from #{params['account_id']}"
      redirect_to current_user
    end
  end
  

  def correct_user?
    unless current_user == @account.user
      redirect_to root_url, :alert => "Access denied."
    end
  end
  
end
