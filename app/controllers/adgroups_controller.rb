class AdgroupsController < ApplicationController
  # GET /adgroups
  # GET /adgroups.json
  def index
    @adgroups = Adgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adgroups }
    end
  end

  # GET /adgroups/1
  # GET /adgroups/1.json
  def show
    @adgroup = Adgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adgroup }
    end
  end

  # GET /adgroups/new
  # GET /adgroups/new.json
  def new
    @adgroup = Adgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adgroup }
    end
  end

  # GET /adgroups/1/edit
  def edit
    @adgroup = Adgroup.find(params[:id])
  end

  # POST /adgroups
  # POST /adgroups.json
  def create
    @adgroup = Adgroup.new(params[:adgroup])

    respond_to do |format|
      if @adgroup.save
        format.html { redirect_to @adgroup, notice: 'Adgroup was successfully created.' }
        format.json { render json: @adgroup, status: :created, location: @adgroup }
      else
        format.html { render action: "new" }
        format.json { render json: @adgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /adgroups/1
  # PUT /adgroups/1.json
  def update
    @adgroup = Adgroup.find(params[:id])

    respond_to do |format|
      if @adgroup.update_attributes(params[:adgroup])
        format.html { redirect_to @adgroup, notice: 'Adgroup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @adgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adgroups/1
  # DELETE /adgroups/1.json
  def destroy
    @adgroup = Adgroup.find(params[:id])
    @adgroup.destroy

    respond_to do |format|
      format.html { redirect_to adgroups_url }
      format.json { head :ok }
    end
  end
end
