class UserMailer < ApplicationMailer
  default from: 'notspam@icantbelieveitsnotspam.com'

  def welcome_email(user)
    @user = user

    mail(to: user.username, subject: 'Welcome to the beginning of the end of your free time')
  end
end
