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
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if !current_user || params[:id] && params[:id].to_i != current_user.id
      render file: '/public/404'
    end
    @user = current_user
    @idea = Idea.new
    @categories = Category.all
    @images = Image.all
  end

  def edit
    if !current_user || params[:id] && params[:id].to_i != current_user.id
      render file: '/public/404'
    end
    @user = current_user
  end

  def update
    @user = current_user
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
