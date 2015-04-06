class RegistrationMailer < ActionMailer::Base
  default from: "dojotube101@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = root_url
  	attachments.inline['logo.png'] = File.read('/home/chris/dev/dojoTube2/app/assets/images/logo.png')

  	mail(to: @user.email, subject: 'Welcome to DojoTube')
  end
end
