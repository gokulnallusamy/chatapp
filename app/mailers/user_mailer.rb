class UserMailer < ApplicationMailer

  default from: 'notifications@mychatapp.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Chat App')
  end
end
