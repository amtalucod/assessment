class StaticPagesController < ApplicationController
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
end
