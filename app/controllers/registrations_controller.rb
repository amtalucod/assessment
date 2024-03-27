class RegistrationsController < ApplicationController
    before_action :admin_user, only: [:destroy]
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path, notice: "Account has been successfully deleted."
    end
      
    
    def new
        @user = User.new
    end
  
    def create
        @user = User.new(user_params) 
        
        if params[:image].present?
            begin
              cloudinary_response = Cloudinary::Uploader.upload(params[:image].tempfile)
              @user.image = cloudinary_response['secure_url']
            end
        end
        
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
         render 'new'
        end
    end
      
    private
    def admin_user
        unless current_user.admin?
          redirect_to index_path, notice: "Not Authorized"
          return
        end
    end
end
