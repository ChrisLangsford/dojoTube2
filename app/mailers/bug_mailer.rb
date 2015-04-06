class BugMailer < ActionMailer::Base
  default from: "dojotube101@gmail.com"

  def bug_email(bug)
  	@user = bug.user
  	@descrip = bug.description

  	mail(to: "langz020@gmail.com", subject: 'Bug Report')
  end
end
