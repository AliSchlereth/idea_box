class ImagesController < ApplicationController

  def show
    @user = current_user
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:url)
  end

end
