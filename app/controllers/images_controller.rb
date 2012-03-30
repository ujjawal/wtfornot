class ImagesController < ApplicationController
    
  #before_filter :authenticate_user!

  # GET /images
  # GET /images.json
  def index
    #@images = Image.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @images }
    #end
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/new
  # GET /images/new.json
  def new
    #@image = Image.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @image }
    #end
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /images/1/edit
  def edit
    #@image = Image.find(params[:id])
    raise ActionController::RoutingError.new('Not Found')
  end

  # POST /images
  # POST /images.json
  def create
    #@image = Image.new(params[:image])

    #respond_to do |format|
    #  if @image.save
    #    format.html { redirect_to @image, notice: 'Image was successfully created.' }
    #    format.json { render json: @image, status: :created, location: @image }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @image.errors, status: :unprocessable_entity }
    #  end
    #end
    raise ActionController::RoutingError.new('Not Found')
  end

  # POST /images/1/add_point
  # POST /images/1/add_point.json
  def add_point
    @hailwtfornot = Hailwtfornot.find(params[:hailwtfornot_id])
    if !user_signed_in?
      render :json => { :result => "login"}
    elsif @hailwtfornot.user and @hailwtfornot.user == current_user
      render :json => { :result => "failure"}
    else
      authenticate_user!
      @image = Image.find(params[:image_id])
      @image.points+=1
      @hailwtfornot.points+=1

      wtfornot_user = WtfornotUser.new(:wtfornot_id => @hailwtfornot.id, :user_id => current_user.id)


      Hailwtfornot.transaction do
        if @image.save and @hailwtfornot.save! and wtfornot_user.save!
          if @image.user
            @image.user.points+=1
            @image.user.save!
          end
          render :json => { :result => "success"}
        else
          render :json => { :result => "failure"}
        end
      end
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    #@image = Image.find(params[:id])

    #respond_to do |format|
    #  if @image.update_attributes(params[:image])
    #    format.html { redirect_to @image, notice: 'Image was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
    #    format.json { render json: @image.errors, status: :unprocessable_entity }
    #  end
    #end
    raise ActionController::RoutingError.new('Not Found')
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    #@image = Image.find(params[:id])
    #@image.destroy

    #respond_to do |format|
    #  format.html { redirect_to images_url }
    #  format.json { head :no_content }
    #end
    raise ActionController::RoutingError.new('Not Found')
  end
end
