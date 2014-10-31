class RegistrationMailer < ActionMailer::Base
  default from: "langz020@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = root_url

  	mail(to: @user.email, subject: 'Welcome to DojoTube')
  end
end
