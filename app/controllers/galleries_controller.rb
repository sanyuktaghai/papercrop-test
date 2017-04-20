class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json

  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.save
    respond_to do |format|
      format.js {render "new"}
    end
    # respond_to do |format|
    #   # if @gallery.save
    #   #   # format.js {render "create"}
    #   #   # format.html { render :edit}
    #   #   # format.json { render json: @gallery, status: :created, location: @gallery }

    #   # else
    #   #   format.html { render action: "new" }
    #   #   format.json { render json: @gallery.errors, status: :unprocessable_entity }
    #   # end
    # end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])
    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        format.js {render "crop"}
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }

      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end
  
  private

  def gallery_params
    params.require(:gallery).permit(:name, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :photo_original_w, :photo_original_h, :photo_box_w, :photo_crop_x, :photo_crop_y, :photo_crop_w, :photo_crop_h, :photo_aspect)
    # params.require(:gallery).permit(Gallery.fields.keys)
  end
end
