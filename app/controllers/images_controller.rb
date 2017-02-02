class ImagesController < ApplicationController

  before_action :image_find, only: [:show, :destroy, :edit, :update]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to root_path
    else
      #redirect_to new_image_path
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update_attributes(image_params)
      redirect_to image_path(@image)
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to root_path
  end

  private

  def image_params
    params.require(:image).permit(:artist, :title, :url)
  end

  def image_find
    @image = Image.find(params[:id])
  end

end
