class PermittedParams < Struct.new(:params, :current_user)
  def user
    params.require(:user).permit(*user_attributes)
  end
  def user_attributes
    if current_user.admin?
      [:name, :email,:password, :password_confirmation, :role ,:admin]
    else
      [ :name, :email, :remember_me,:password, :password_confirmation, ]
    end
  end
end