class IdeasController <ApplicationController

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      redirect_to user_idea_path(@user, @idea)
    else
      redirect_to user_path(@user)
    end
  end

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas.all
  end

  def show
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    @categories = Category.all
  end

  def update
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(idea_params)
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :resources, :category_id)
  end


end
