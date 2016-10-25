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

  def show
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description, :resources)
  end


end
