class LoungesController < ApplicationController
  # GET /lounges
  # GET /lounges.json
  def index
    @lounges = Lounge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lounges }
    end
  end

  # GET /lounges/1
  # GET /lounges/1.json
  def show
    @lounge = Lounge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lounge }
    end
  end

  # GET /lounges/new
  # GET /lounges/new.json
  def new
    @lounge = Lounge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lounge }
    end
  end

  # GET /lounges/1/edit
  def edit
    @lounge = Lounge.find(params[:id])
  end

  # POST /lounges
  # POST /lounges.json
  def create
    @lounge = Lounge.new(params[:lounge])

    respond_to do |format|
      if @lounge.save
        format.html { redirect_to @lounge, notice: 'Lounge was successfully created.' }
        format.json { render json: @lounge, status: :created, location: @lounge }
      else
        format.html { render action: "new" }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lounges/1
  # PUT /lounges/1.json
  def update
    @lounge = Lounge.find(params[:id])

    respond_to do |format|
      if @lounge.update_attributes(params[:lounge])
        format.html { redirect_to @lounge, notice: 'Lounge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lounges/1
  # DELETE /lounges/1.json
  def destroy
    @lounge = Lounge.find(params[:id])
    @lounge.destroy

    respond_to do |format|
      format.html { redirect_to lounges_url }
      format.json { head :no_content }
    end
  end
end
