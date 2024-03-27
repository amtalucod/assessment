class RegistrationsController < ApplicationController
    before_action :admin_user, only: [:destroy]
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path, notice: "Account has been successfully deleted."
    end
      
      
    private
    def admin_user
        unless current_user.admin?
          redirect_to index_path, notice: "Not Authorized"
          return
        end
    end
end
