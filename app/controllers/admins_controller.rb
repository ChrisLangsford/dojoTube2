class AdminsController < ApplicationController
 before_action :set_user, only: [:edit_user, :update_user]
 def index
 	@users = User.all
 end

 def new_user
  #authorize! :manage, User
   @user = User.new
 end
 def create_user
    @user = User.new(user_params)
    #authorize! :manage, User
    @user.save   
    redirect_to admins_users_path
 end

 def edit_user 	
 end

 def update_user
 	if @user.update(user_params)
 		redirect_to admins_users_path
 	else
 		redirect_to admins_edit_user_path
 	end
 end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation, :role ,:admin)
    end 
end