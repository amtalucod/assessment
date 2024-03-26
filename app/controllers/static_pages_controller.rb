class StaticPagesController < ApplicationController
  #before_action :logged_in_user, only: [:index]
  
  def home
  end

  def help
  end
  
  def user_profile
  end
  
  # GET /users or /users.json
  def index
    @users = User.all
  end
  
  private
    def logged_in_user
      unless signed_in?
        flash[:alert] = "Please Log in to continue."
        redirect_to new_user_session_path
      end
    end
  

end
