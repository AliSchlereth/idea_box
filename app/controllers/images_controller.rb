class ImagesController < ApplicationController

  def show
    @user = current_user
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
