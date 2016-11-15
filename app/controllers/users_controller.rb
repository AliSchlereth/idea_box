class UsersController < ApplicationController
before_action :logged_in?, except: [:new, :create]

  def new
    @user = User.new
    @categories = Category.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully created new account!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # @user = current_user
    @user = User.find(params[:id])
    @idea = Idea.new
    @ideas = Idea.all
    @categories = Category.all
    @images = Image.all
  end

  def edit
    # @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
