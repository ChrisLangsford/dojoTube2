class RegistrationMailer < ActionMailer::Base
  default from: "dojotube101@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = root_url
  	attachments.inline['logo.png'] = File.read('#{RAILS_ROOT}/app/assets/images/logo.png')

  	mail(to: @user.email, subject: 'Welcome to DojoTube')
  end
end
