class CategoriesController < ApplicationController

  def show
    @user = current_user
    @category = Category.find(params[:id])
    @ideas = @category.ideas.where(user_id: @user.id)
  end

  def index
    @categories = Category.all
  end


end
