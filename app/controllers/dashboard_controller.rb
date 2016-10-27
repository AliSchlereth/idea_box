class DashboardController < ApplicationController

  def show
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to login_path
    end
  end

end
