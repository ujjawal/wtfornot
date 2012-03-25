class HailwtfornotsController < ApplicationController
  # GET /hailwtfornots
  # GET /hailwtfornots.json
  def index
    @hailwtfornots = Hailwtfornot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hailwtfornots }
    end
  end

  # GET /hailwtfornots/1
  # GET /hailwtfornots/1.json
  def show
    @hailwtfornot = Hailwtfornot.find(params[:id])
    @image1 = Image.find(@hailwtfornot.image1)
    @image2 = Image.find(@hailwtfornot.image2)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hailwtfornot }
    end
  end

  # GET /hailwtfornots/new
  # GET /hailwtfornots/new.json
  def new
    @hailwtfornot = Hailwtfornot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hailwtfornot }
    end
  end

  # GET /hailwtfornots/1/edit
  def edit
    @hailwtfornot = Hailwtfornot.find(params[:id])
  end

  # POST /hailwtfornots
  # POST /hailwtfornots.json
  def create
    @hailwtfornot = Hailwtfornot.create_new params

    respond_to do |format|
      if !@hailwtfornot.errors.any?
        format.html { redirect_to @hailwtfornot, notice: 'Hailwtfornot was successfully created.' }
        format.json { render json: @hailwtfornot, status: :created, location: @hailwtfornot }
      else
        format.html { render action: "new" }
        format.json { render json: @hailwtfornot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hailwtfornots/1
  # PUT /hailwtfornots/1.json
  def update
    @hailwtfornot = Hailwtfornot.find(params[:id])

    respond_to do |format|
      if @hailwtfornot.update_attributes(params[:hailwtfornot])
        format.html { redirect_to @hailwtfornot, notice: 'Hailwtfornot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hailwtfornot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hailwtfornots/1
  # DELETE /hailwtfornots/1.json
  def destroy
    @hailwtfornot = Hailwtfornot.find(params[:id])
    @hailwtfornot.destroy

    respond_to do |format|
      format.html { redirect_to hailwtfornots_url }
      format.json { head :no_content }
    end
  end
end
