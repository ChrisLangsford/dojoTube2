class UserController < ApplicationController
   load_and_authorize_resource
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    #excludes(:id => current_user.id)
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to user_index_path
    else
      render :action => 'new'
    end
  end

  def edit    
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy    
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin )
    end
end
