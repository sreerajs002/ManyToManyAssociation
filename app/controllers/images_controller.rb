class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :get_attachment,only: [:create,:new,:edit, :update,]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show 
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    respond_to do |format|
      params[:photo].each do |photo|
        @image = Image.new
        @image.photo=photo
        @image.attachment=@attachment
        if @image.save
        format.html { redirect_to @attachment, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
        else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      params[:photo].each do |photo|
        @image.photo=photo
        @image.attachment=@attachment
        if @image.save
        format.html { redirect_to @attachment, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @attachment }
        else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:attachment_id,:photo)
    end
     def get_attachment
      @attachment= Attachment.find(params[:aid])
       
    end
end
