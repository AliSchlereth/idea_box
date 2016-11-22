class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = Image.all
  end

  private
  def image_params
    params.require(:image).permit(:url)
  end


end
