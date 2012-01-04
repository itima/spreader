class CreativesController < ApplicationController
  before_filter :authenticate_user!

  # GET /creatives
  # GET /creatives.json
  def index
    @creatives = current_user.creatives

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @creatives }
    end
  end

  # GET /creatives/1
  # GET /creatives/1.json
  def show
    @creative = Creative.find(params[:id])
    correct_user?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @creative }
    end
  end

  # GET /creatives/new
  # GET /creatives/new.json
  def new
    @creative = Creative.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @creative }
    end
  end

  # GET /creatives/1/edit
  def edit
    @creative = Creative.find(params[:id])
  end

  # POST /creatives
  # POST /creatives.json
  def create
    @creative = Creative.new(params[:creative])
    correct_user?

    respond_to do |format|
      if @creative.save
        format.html { redirect_to @creative, notice: 'Creative was successfully created.' }
        format.json { render json: @creative, status: :created, location: @creative }
      else
        format.html { render action: "new" }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /creatives/1
  # PUT /creatives/1.json
  def update
    @creative = Creative.find(params[:id])
    correct_user?

    respond_to do |format|
      if @creative.update_attributes(params[:creative])
        format.html { redirect_to @creative, notice: 'Creative was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1
  # DELETE /creatives/1.json
  def destroy
    @creative = Creative.find(params[:id])
    correct_user?
    @creative.destroy

    respond_to do |format|
      format.html { redirect_to creatives_url }
      format.json { head :ok }
    end
  end
  
  def correct_user?
    unless current_user == @creative.user
      redirect_to root_url, :alert => "Access denied."
    end
  end
  
end
