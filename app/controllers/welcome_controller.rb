class WelcomeController < ApplicationController
	layout "welcome"
	skip_before_action :authenticate_user!
  def index
  	if current_user.present?
  		redirect_to videos_path
  	end
  end
end
