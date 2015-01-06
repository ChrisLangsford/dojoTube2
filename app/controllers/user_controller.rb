class UserController < ApplicationController
   load_and_authorize_resource
   before_action :set_user, only: [:show, :edit, :update, :destroy, :change_status]

  def index
    @users = User.all
    #excludes(:id => current_user.id) 
    @dojos = Dojo.all   
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = "12345678"
    @user.password_confirmation = "12345678"
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to user_index_path
      #RegistrationMailer.welcome_email(@user).deliver
    else
      render :action => 'new'
    end
  end

  def edit    
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to user_index_path
    else
      render :action => 'edit'
    end
  end

  def change_status
    if @user.active
      @user.active = false
      @user.save
    else
      @user.active = true
      @user.save
    end  
    redirect_to user_index_path  
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
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :adult, :rank, :active, :dojo_id)
    end
end
