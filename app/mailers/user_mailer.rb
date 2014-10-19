class UserMailer < ActionMailer::Base
  default from: 'from@forrestaparker.com'

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'forresta.parker@gmail.com', subject: 'New Visitor\'s Email')
  end
end