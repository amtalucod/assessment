class StaticPagesController < ApplicationController
  #before_action :logged_in_user, only: [:index]
  
  def home
  end

  def help
  end
  
  def user_profile
    @user = User.find(params[:id])
    
  end
  
  # GET /users or /users.json
  def index
    @users = User.all
    if params[:search].present?
      @users = @users.where("name LIKE ?", "%#{params[:q]}%") if params[:q].present?
    end
  end
  
  
  private
    def logged_in_user
      unless signed_in?
        flash[:alert] = "Please Log in to continue."
        redirect_to new_user_session_path
      end
    end
  

end
