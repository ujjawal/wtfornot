class ImageFilesController < ApplicationController
  # GET /image_files
  # GET /image_files.json
  def index
    @image_files = ImageFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @image_files }
    end
  end

  # GET /image_files/1
  # GET /image_files/1.json
  def show
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/new
  # GET /image_files/new.json
  def new
    @image_file = ImageFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image_file }
    end
  end

  # GET /image_files/1/edit
  def edit
    @image_file = ImageFile.find(params[:id])
  end

  # POST /image_files
  # POST /image_files.json
  def create
    is_qq = params.has_key?(:qqfile)
    if is_qq
      params[:image_file][:file] = params.delete(:file)
    end

    @image_file = ImageFile.new(params[:image_file])

    respond_to do |format|
      if @image_file.save
        format.html { redirect_to @image_file, notice: 'Image file was successfully created.' }
        format.json { render json: @image_file, status: :created, location: @image_file }
      else
        format.html { render action: "new" }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /image_files/1
  # PUT /image_files/1.json
  def update
    @image_file = ImageFile.find(params[:id])

    respond_to do |format|
      if @image_file.update_attributes(params[:image_file])
        format.html { redirect_to @image_file, notice: 'Image file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_files/1
  # DELETE /image_files/1.json
  def destroy
    @image_file = ImageFile.find(params[:id])
    @image_file.destroy

    respond_to do |format|
      format.html { redirect_to image_files_url }
      format.json { head :no_content }
    end
  end
end
