class ImagesController < ApplicationController

  def show
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:url)
  end

end
